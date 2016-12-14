package auth_system;

import Interfaces.ICompletion;
import database.DBUserManager;
import model.Users.BaseUser;
import utils.BodyGetter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

/**
 * Created by NSD on 09.12.16.
 */
public class AuthManager {

    private static volatile AuthManager instance;

    public static AuthManager getInstance() {
        AuthManager localInstance = instance;
        if (localInstance == null) {
            synchronized (DBUserManager.class) {
                localInstance = instance;
                if (localInstance == null) {
                    instance = localInstance = new AuthManager();
                }
            }
        }
        return localInstance;
    }


    public void auth(final HttpServletRequest request, final ICompletion completion){



        final Cookie[] cookie =  request.getCookies();
        if(cookie!=null&&cookie.length>0) {

           final String uName = cookie[0].getValue();
           final String uToken = cookie[1].getValue();

           if(!(uName.isEmpty())&&!(uToken.isEmpty())){

               DBUserManager.getInstance().validateTokenAndGetUser(uName, uToken, new ICompletion() {
                   @Override
                   public void afterOperation(Object bundle) {
                       BaseUser baseUser = (BaseUser) bundle;
                        completion.afterOperation(baseUser);
                   }
               });

           }






        }else {
            String requestBody = null ;
            try {
                requestBody = BodyGetter.getBody(request);

            } catch (IOException e) {

            }
            String uName ;
            String uPass;
            if(requestBody!=null){



            }




        }

    }





    public void deauth(){}
    public void registration(){}

}
