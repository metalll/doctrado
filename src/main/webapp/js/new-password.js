function restorePassword(){var e=$(".reset-your-password"),r=$(e[1]).val();e=$(e[0]).val(),e==r?$.ajax({type:"post",url:"restorePassword",data:{user_id:user_id,pass:e},success:function(){window.location.href="https://doctrado.me/profile"}}):$("#new-pass-error").fadeIn().delay(2e3).fadeOut()}