package utils;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import java.util.Properties;

/**
 * Created by tqy on 16/4/6.
 */
public class JavaMailUtils {
    private static final String SEND_MAIL = "softwendao@163.com";
    private static final String SEND_MAIL_PW = "666666";

    static public boolean sendMail(String receiveMail, String sendContent, String sendSubject) {

        try {
            Properties props = new Properties();
            //传递一个邮件服务器名smtp.163.com
            //mail.smtp.host代表是发信人所在的邮箱服务器名
            props.put("mail.smtp.host", "smtp.163.com");
            props.put("mail.smtp.auth", true);
            //对于发送邮件，只需要保证发送人所在的邮件服务器正确打开就可以了
            //收信人的邮箱可以是任意地址，如@163.com,@qq.com,@126.com

            //创建一个程序与邮件服务器的通信
            Session mailConnection = Session.getInstance(props, null);
            Message msg = new MimeMessage(mailConnection);


            //设置发送人和接受人
            Address sender = new InternetAddress(SEND_MAIL);
            Address receiver = new InternetAddress(receiveMail);

            msg.setFrom(sender);
            msg.setRecipient(Message.RecipientType.TO, receiver);
            msg.setSubject(sendSubject);

            //下面是模拟发送带附件的邮件
            //新建一个MimeMultipart对象用来存放多个BodyPart对象
            Multipart mtp = new MimeMultipart();
            //------设置信件文本内容------
            //新建一个存放信件内容的BodyPart对象
            BodyPart mdp = new MimeBodyPart();
            //给BodyPart对象设置内容和格式/编码方式
            mdp.setContent(sendContent, "text/html;charset=gb2312");
            //将含有信件内容的BodyPart加入到MimeMultipart对象中
            mtp.addBodyPart(mdp);
            msg.setContent(mtp);

            //先进行存储邮件
            msg.saveChanges();

            Transport trans = mailConnection.getTransport("smtp");
            //邮件服务器名,用户名，密码
            trans.connect("smtp.163.com", SEND_MAIL, SEND_MAIL_PW);
            trans.sendMessage(msg, msg.getAllRecipients());
            trans.close();
        } catch (Exception e) {
            System.err.println(e);
        } finally {
            System.exit(0);
        }
        return false;
    }
}
