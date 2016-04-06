import org.junit.Test;

import java.util.Properties;
import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Address;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

/**
 * Created by tqy on 16/4/6.
 */
public class JavamailTest {
   @Test
    public void mailTest() {
      try{
         Properties props=new Properties();
         //传递一个邮件服务器名smtp.163.com
         //mail.smtp.host代表是发信人所在的邮箱服务器名
         props.put("mail.smtp.host", "smtp.163.com");
         props.put("mail.smtp.auth", true);
         //对于发送邮件，只需要保证发送人所在的邮件服务器正确打开就可以了
         //收信人的邮箱可以是任意地址，如@163.com,@qq.com,@126.com

         //创建一个程序与邮件服务器的通信
         Session mailConnection=Session.getInstance(props,null);
         Message msg=new MimeMessage(mailConnection);

         //创建一个要输入用户名和指令的
         //Session mailConnection=Session.getInstance(props,new MailAuthenticator());


         //设置发送人和接受人
         Address sender=new InternetAddress("njtangqy@163.com");
         Address receiver=new InternetAddress("353216134@qq.com");

            /*
             * 群发邮件的方法
             * StringBuffer buffer=new StringBuffer();
             * buffer.append("11@163.com,")
             * buffer.append("22@163.com")
             * String all=buffer.toString();
             * Address[] allre=InternetAddress.parse(all);
             * msg.setRecipient(Message.RecipientType.TO, allre);
             */
         msg.setFrom(sender);
         msg.setRecipient(Message.RecipientType.TO, receiver);
         msg.setSubject("You must comply");

         //msg.setContent("Hello", "text/plain");


         //下面是模拟发送带附件的邮件
         //新建一个MimeMultipart对象用来存放多个BodyPart对象
         Multipart mtp = new MimeMultipart();
         //------设置信件文本内容------
         //新建一个存放信件内容的BodyPart对象
         BodyPart mdp = new MimeBodyPart();
         //给BodyPart对象设置内容和格式/编码方式
         mdp.setContent("hello","text/html;charset=gb2312");
         //将含有信件内容的BodyPart加入到MimeMultipart对象中
         mtp.addBodyPart(mdp);

         //设置信件的附件(用本地机上的文件作为附件)
//         mdp=new MimeBodyPart();
//         FileDataSource fds=new FileDataSource("f:/webservice.doc");
//         DataHandler dh=new DataHandler(fds);
//         mdp.setFileName("webservice.doc");//可以和原文件名不一致
//         mdp.setDataHandler(dh);
//         mtp.addBodyPart(mdp);
         //把mtp作为消息对象的内容
           msg.setContent(mtp);

         //以上为发送带附件的方式
         //先进行存储邮件
         msg.saveChanges();

         Transport trans=mailConnection.getTransport("smtp");
         String username="xxx@163.com";
         String pw="xxx";
         //邮件服务器名,用户名，密码
         trans.connect("smtp.163.com", username,  pw);
         trans.sendMessage(msg, msg.getAllRecipients());
         trans.close();
      }catch(Exception e)
      {
         System.err.println(e);
      }
      finally{
         System.exit(0);
      }
   }
}
