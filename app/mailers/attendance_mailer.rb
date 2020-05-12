class AttendanceMailer < ApplicationMailer
    default from: 'rostom.halaimia@gmail.com'
 
    def attendance_email(attendance)
      #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
      @attendance = attendance
  
      #on définit une variable @url qu'on utilisera dans la view d’e-mail
      @url  = 'https://myeventbrite-app-thp.herokuapp.com/' 
  
      # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
      mail(to: @attendance.user.email, subject: "Tu es inscrit(e) à l'évènement #{@attendance.event.title}") 
    end
end
