﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using TLLib;

public partial class lien_he : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Title = "Contact";
        var meta = new HtmlMeta() { Name = "description", Content = "Contact" };
        Header.Controls.Add(meta);
    }
    private void sendEmail()
    {
        string msg = "<h3>HONG DUC EXPRESS: CONTACT</h3><br/>";
        msg += "<b>Full name: </b>" + txtFullName.Text.Trim().ToString() + "<br />";
        msg += "<b>Email: </b>" + txtEmail.Text.Trim().ToString() + "<br />";
        msg += "<b>Phone: </b>" + txtPhone.Text.Trim().ToString() + "<br />";
        msg += "<b>Message: </b>" + txtContent.Text.Trim().ToString();
        Common.SendMail("smtp.gmail.com", 587, "webmastersendmail0401@gmail.com", "web123master", "thanh.le@hongducexpress.com", "", "Contact HONG DUC EXPRESS", msg, true);
        Common.SendMail("smtp.gmail.com", 587, "webmastersendmail0401@gmail.com", "web123master", "hung.nguyen@hongducexpress.com", "", "Contact HONG DUC EXPRESS", msg, true);
    }
    protected void btSend_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (RadCaptcha1.IsValid)
            {

                //send email         
                sendEmail();
                ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "runtime", " $(document).ready(function () {alert('Thanks you for your contacting with us. We will reply your request as soon as we can!')});", true);
                //lblMessage.Text = "Cám ơn bạn đã liên lạc với chúng tôi. Thông báo của bạn đã được gửi đi. Chúng tôi sẽ liên lạc với bạn trong thời gian sớm nhất!";
                //lblMessage.Visible = true;
                //lblMessage.Text = "";
                //
                //Clear text
                //
                txtFullName.Text = "";
                txtEmail.Text = "";
                txtPhone.Text = "";
                txtContent.Text = "";
            }
            //else
            //{
            //    lblMessage.Text = "Chuỗi xác nhận chưa đúng !";
            //}
        }
    }
    protected string progressTitle(object input)
    {
        return Common.ConvertTitle(input.ToString());
    }
}