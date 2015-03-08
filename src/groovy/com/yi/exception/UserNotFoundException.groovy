package com.yi.exception

/**
 * Created by yi on 08/03/15.
 */
class UserNotFoundException extends RuntimeException{

    def msg
    UserNotFoundException(){

    }
    UserNotFoundException(def msg){
        this.msg = msg
    }
    String toString(){
        this.msg?this.msg:"User Not Found."
    }

}
