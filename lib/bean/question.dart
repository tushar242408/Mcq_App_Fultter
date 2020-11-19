class questionmodel{
  String question,imgurl,answer,opt1,opt2,opt3,opt4;
  questionmodel({this.imgurl,this.answer,this.question});
  void setQuestion(String question){
    this.question=question;
  }
  void setImgurl(String imgurl){
    this.imgurl=imgurl;
  }
  void setOpt1(String opt1){
    this.opt1=opt1;
  }
  void setOpt2(String opt2){
    this.opt2=opt2;
  }
  void setOpt3(String opt3){
    this.opt3=opt3;
  }
  void setOpt4(String opt4){
    this.opt4=opt4;
  }
  void setAnswer(String answer){
    this.answer=answer;
  }
  String getQuestion(){
    return question;
  }
  String getImgurl(){
    return imgurl;
  }
  String getAnswer(){
    return answer;
  }
  String getOpt1(){
    return opt1;
  }
  String getOpt2(){
    return opt2;
  }
  String getOpt3(){
    return opt3;
  }
  String getOpt4(){
    return opt4;
  }


}