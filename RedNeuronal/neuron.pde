class neuron {

  private float value;
  private ArrayList<conection> listeners;
  
  neuron (){
  
    value=0;
    listeners = new ArrayList<conection>();
  
  }
  
  void setValue (float t) {
  
    value = t;
    for(conection temp : listeners){ 
      temp.pass(value,this);
    }
  
  }
  
  float getValue(){
      
      return(value);
      
  }
  
  void addListener (conection t){
  
    listeners.add(t);
  
  }
  
  void removeListener (conection t){
  
    listeners.remove(t);
  
  }
  



}