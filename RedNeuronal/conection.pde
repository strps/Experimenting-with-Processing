class conection {
  
  float mult;
  neuron A;
  neuron B;
  
  conection (neuron a, neuron b){
  
    mult=1;
    A = a;
    B = b;
    A.addListener(this);
    
  
  }
  
  void pass (float tv, neuron tn) {
    
    if(tn == A){
      B.setValue(tv*abs(mult));
    }else{
      A.setValue(tv*abs(mult));
    }
  
    
  }
  
  void setValue (float t){
  
    mult = t;
    
    if (mult >= 0){
      A.addListener(this);
      B.removeListener(this);
    }else{
      B.addListener(this);
      A.removeListener(this);
    }
    
  }
  



}