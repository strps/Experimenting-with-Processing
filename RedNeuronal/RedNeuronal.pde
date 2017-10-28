void setup (){
  
  net myNet = new net();
  myNet.addNeuron();
  myNet.addNeuron();
  myNet.addNeuron();
  myNet.addNeuron();

  myNet.getSize();
  
  myNet.setNeuronValue(0,0.5);
  myNet.prtNeuronValue(0);
  
}