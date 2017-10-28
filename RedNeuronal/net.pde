class net {
  ArrayList<neuron> neurons;
  ArrayList<conection> conections;
  
  net(){
    neurons = new ArrayList<neuron>();
    conections = new ArrayList<conection>();
  }
  
  void addNeuron () {
  
    neurons.add(new neuron());
    int size = neurons.size();
    for(int i=0; i<size-1; i++){
      conections.add(new conection(neurons.get(i),neurons.get(size-1)));
    }
  
  }
  
  void getSize () {
  
    println (neurons.size());
    println (conections.size());
  
  }
  void setNeuronValue (int index, float val) {
    
      if(val<=1 && val>=0){
        neurons.get(index).setValue(val);
      }else{
        println("incorect value");
      }
  }
  
  void prtNeuronValue (int index) {
  
    if (index < neurons.size() && index >= 0){
    println(neurons.get(index).getValue());
    }else{
      println("no valid index");
    }
  }
    



}