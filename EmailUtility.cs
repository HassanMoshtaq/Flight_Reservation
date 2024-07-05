using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;
using System.Net.Mail;
using System.Configuration;

namespace WebBased_Project
{
    public class EmailUtility
    {
        public static void SendEmail(string toEmail, string subject, string body)
        {
            if (string.IsNullOrEmpty(toEmail))
            {
                throw new ArgumentException("toEmail cannot be null or empty", nameof(toEmail));
            }

            try
            {
                // Retrieve settings from web.config
                string host = ConfigurationManager.AppSettings["mailSettings:smtp:network:host"];
                string port = ConfigurationManager.AppSettings["mailSettings:smtp:network:port"];
                string userName = ConfigurationManager.AppSettings["mailSettings:smtp:network:userName"];
                string password = ConfigurationManager.AppSettings["mailSettings:smtp:network:password"];
                string enableSsl = ConfigurationManager.AppSettings["mailSettings:smtp:network:enableSsl"];
                string from = ConfigurationManager.AppSettings["mailSettings:smtp:from"];

                if (string.IsNullOrEmpty(host) || string.IsNullOrEmpty(port) || string.IsNullOrEmpty(userName) ||
                    string.IsNullOrEmpty(password) || string.IsNullOrEmpty(enableSsl) || string.IsNullOrEmpty(from))
                {
                    throw new ArgumentException("SMTP configuration settings are missing or incomplete.");
                }

                SmtpClient smtpServer = new SmtpClient
                {
                    Host = host,
                    Port = int.Parse(port),
                    Credentials = new NetworkCredential(userName, password),
                    EnableSsl = bool.Parse(enableSsl)
                };

                MailMessage mail = new MailMessage
                {
                    From = new MailAddress(from),
                    Subject = subject,
                    Body = body,
                    IsBodyHtml = true
                };
                mail.To.Add(toEmail);

                smtpServer.Send(mail);
            }
            catch (SmtpException ex)
            {
                // Log or handle the SMTP-specific exception as needed
                throw new Exception("Error sending email: " + ex.Message, ex);
            }
            catch (Exception ex)
            {
                // Log or handle the general exception as needed
                throw new Exception("Error sending email: " + ex.Message, ex);
            }
        }
  }    }