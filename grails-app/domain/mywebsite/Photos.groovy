package mywebsite

class Photos {

    String photoName
    Integer likeAccount
    Integer createTime

    static belongsTo = [album:Albums]

    static constraints = {
    }
}
