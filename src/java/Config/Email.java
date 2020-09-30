package Config;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Email {

    public boolean enviarCorreo(String para, String contra) {
        boolean enviado = false;
        try {

            String de = "panalerapaola11@gmail.com";
            String clave = "babyfull123.";
            String asunto = "¡Bienvenido a BabyFull!";
            String mensaje = "!Hola! \n BabyFull te quiere dar la bienvenida, ahora haces parte de nuestra familia. \n Si tienes alguna duda, consulta con el administrador del Sistema. \n \n Esta es tu clave de ingreso:  ";
            String host = "smtp.gmail.com";

            Properties prop = System.getProperties();

            prop.put("mail.smtp.starttls.enable", "true");
            prop.put("mail.smtp.host", host);
            prop.put("mail.smtp.user", de);
            prop.put("mail.smtp.password", clave);
            prop.put("mail.smtp.port", 587);
            prop.put("mail.smtp.auth", "true");

            Session sesion = Session.getDefaultInstance(prop, null);

            MimeMessage message = new MimeMessage(sesion);

            message.setFrom(new InternetAddress(de));

            message.setRecipient(Message.RecipientType.TO, new InternetAddress(para));

            message.setSubject(asunto);

            message.setText(mensaje + contra);

            Transport transport = sesion.getTransport("smtp");

            transport.connect(host, de, clave);

            transport.sendMessage(message, message.getAllRecipients());

            transport.close();

            enviado = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return enviado;
    }

    public boolean Recuperarcontra(String para, String contra) {
        boolean enviado = false;
        try {

            String de = "panalerapaola11@gmail.com";
            String clave = "babyfull123.";
            String asunto = "¡Clave restablecida con éxito!";
            String mensaje = "Debido a tu solicitud, esta es tu nueva clave para ingresar a nuestro sistema:  ";
            String host = "smtp.gmail.com";

            Properties prop = System.getProperties();

            prop.put("mail.smtp.starttls.enable", "true");
            prop.put("mail.smtp.host", host);
            prop.put("mail.smtp.user", de);
            prop.put("mail.smtp.password", clave);
            prop.put("mail.smtp.port", 587);
            prop.put("mail.smtp.auth", "true");

            Session sesion = Session.getDefaultInstance(prop, null);

            MimeMessage message = new MimeMessage(sesion);

            message.setFrom(new InternetAddress(de));

            message.setRecipient(Message.RecipientType.TO, new InternetAddress(para));

            message.setSubject(asunto);

            message.setText(mensaje + contra);

            Transport transport = sesion.getTransport("smtp");

            transport.connect(host, de, clave);

            transport.sendMessage(message, message.getAllRecipients());

            transport.close();

            enviado = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return enviado;
    }
}
