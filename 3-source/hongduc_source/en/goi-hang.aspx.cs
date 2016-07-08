using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using TLLib;

public partial class goi_hang : System.Web.UI.Page
{
    public static string fileName;
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Title = "Gởi Hàng";
        var meta = new HtmlMeta() { Name = "description", Content = "Gởi Hàng" };
        Header.Controls.Add(meta);
    }
    private void sendEmail()
    {

        string msg = "<h3>HONG DUC EXPRESS: CONTACT</h3><br/>";
        msg += "<b>Chức danh: </b>" + dropChucDanh.SelectedItem.Value + "<br />";
        msg += "<b>Tên: </b>" + txtFirstName.Text.Trim().ToString() + "<br />";
        msg += "<b>Họ: </b>" + txtLastName.Text.Trim().ToString() + "<br />";
        msg += "<b>Chức vụ: </b>" + txtJobs.Text.Trim().ToString() + "<br />";
        msg += "<b>Tên công ty: </b>" + txtCompanyName.Text.Trim().ToString() + "<br />";
        msg += "<b>Thành phố: </b>" + txtCity.Text.Trim().ToString() + "<br />";
        msg += "<b>Mã bưu điện: </b>" + txtZipCode.Text.Trim().ToString() + "<br />";
        msg += "<b>Email: </b>" + txtEmail.Text.Trim().ToString() + "<br />";
        msg += "<b>Phone: </b>" + txtPhone.Text.Trim().ToString() + "<br />";
        msg += "<b>Yêu cầu của quý khách: </b>" + txtContent.Text.Trim().ToString() + "<br />";
        msg += "<b>File: </b>" + "<a href=http://www.hongducexpress.com/res/fileupload/" + fileName + "> " + "File download" + "</a>" + "<br />";

        Common.SendMail("smtp.gmail.com", 587, "webmastersendmail0401@gmail.com", "web123master", "thanh.le@hongducexpress.com", "", "Contact HONG DUC EXPRESS", msg, true);
        Common.SendMail("smtp.gmail.com", 587, "webmastersendmail0401@gmail.com", "web123master", "hung.nguyen@hongducexpress.com", "", "Contact HONG DUC EXPRESS", msg, true);
        Common.SendMail("smtp.gmail.com", 587, "webmastersendmail0401@gmail.com", "web123master", "cc@tranlegroup.com", "", "Contact HONG DUC EXPRESS", msg, true);
        Common.SendMail("smtp.gmail.com", 587, "webmastersendmail0401@gmail.com", "web123master", "hungtien408@gmail.com", "", "Contact HONG DUC EXPRESS", msg, true);
        
    }

    protected void btSend_Click(object sender, EventArgs e)
    {
        if (FileUpload1.FileName != "")
        {
            fileName = FileUpload1.FileName;
            fileName = FileUpload1.FileName != "" ? "hongducexpress_" + DateTime.Now.ToString("ddMMyy") + Guid.NewGuid().GetHashCode().ToString("X").Substring(0, 4) + fileName.Substring(fileName.LastIndexOf(".")) : "";
            string SavePath = Server.MapPath("~/res/fileupload/" + fileName);
            FileUpload1.SaveAs(SavePath);
            if (Page.IsValid)
            {
                //send email         
                sendEmail();
                Common.ShowAlert("Thanks you for your contacting with us. We will reply your request as soon as we can!");

                txtFirstName.Text = "";
                txtLastName.Text = "";
                txtJobs.Text = "";
                txtCompanyName.Text = "";
                txtCity.Text = "";
                txtZipCode.Text = "";
                txtEmail.Text = "";
                txtPhone.Text = "";
                txtContent.Text = "";
            }
        }
        else
        {
            Common.ShowAlert("No attach file!");
        }
    }
    protected void btClear_Click(object sender, EventArgs e)
    {
        txtFirstName.Text = "";
        txtLastName.Text = "";
        txtJobs.Text = "";
        txtCompanyName.Text = "";
        txtCity.Text = "";
        txtZipCode.Text = "";
        txtEmail.Text = "";
        txtPhone.Text = "";
        txtContent.Text = "";
        FileUpload1.ID = null;
    }
    protected string progressTitle(object input)
    {
        return Common.ConvertTitle(input.ToString());
    }
}