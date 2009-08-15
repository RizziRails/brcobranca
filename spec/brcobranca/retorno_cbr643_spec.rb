require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe RetornoCbr643 do
  
  before(:each) do
    @arquivo = File.join(File.dirname(__FILE__),'..','arquivos','CBR64310.RET')
  end

  it "should read correctly values from file" do
    pagamentos = RetornoCbr643.load_lines(@arquivo)
    pagamentos.first.sequencial.should eql("000001")
    pagamentos.first.agencia_com_dv.should eql("CA")
    pagamentos.first.cedente_com_dv.should eql("33251")
    pagamentos.first.convenio.should eql("0002893")
    pagamentos.first.data_liquidacao.should eql("")
    pagamentos.first.data_credito.should eql("")
    pagamentos.first.valor_recebido.should eql("")
    pagamentos.first.nosso_numero.should eql("OSSENSE DO AL001B")
  end

  it "should read correctly values from file with option :except in number" do
    pagamentos = RetornoCbr643.load_lines(@arquivo,{:except => [1]})
    pagamentos.first.sequencial.should eql("000002")
    pagamentos.first.agencia_com_dv.should eql("33251")
    pagamentos.first.cedente_com_dv.should eql("000289353")
    pagamentos.first.convenio.should eql("1622420")
    pagamentos.first.data_liquidacao.should eql("200109")
    pagamentos.first.data_credito.should eql("220109")
    pagamentos.first.valor_recebido.should eql("0000000009064")
    pagamentos.first.nosso_numero.should eql("16224200000000003")
  end

  it "should read correctly values from file with option :except in number and :length" do
    pagamentos = RetornoCbr643.load_lines(@arquivo,{:except => [1], :length => 400})
    pagamentos.first.sequencial.should eql("000002")
    pagamentos.first.agencia_com_dv.should eql("33251")
    pagamentos.first.cedente_com_dv.should eql("000289353")
    pagamentos.first.convenio.should eql("1622420")
    pagamentos.first.data_liquidacao.should eql("200109")
    pagamentos.first.data_credito.should eql("220109")
    pagamentos.first.valor_recebido.should eql("0000000009064")
    pagamentos.first.nosso_numero.should eql("16224200000000003")
  end

  it "should read correctly values from file with option :except in regex" do
    pagamentos = RetornoCbr643.load_lines(@arquivo,{:except => /^[^7]/})
    pagamentos.first.sequencial.should eql("000002")
    pagamentos.first.agencia_com_dv.should eql("33251")
    pagamentos.first.cedente_com_dv.should eql("000289353")
    pagamentos.first.convenio.should eql("1622420")
    pagamentos.first.data_liquidacao.should eql("200109")
    pagamentos.first.data_credito.should eql("220109")
    pagamentos.first.valor_recebido.should eql("0000000009064")
    pagamentos.first.nosso_numero.should eql("16224200000000003")
  end

  it "should read correctly values from file with option :except in regex and :length" do
    pagamentos = RetornoCbr643.load_lines(@arquivo,{:except => /^[^7]/, :length => 400})
    pagamentos.first.sequencial.should eql("000002")
    pagamentos.first.agencia_com_dv.should eql("33251")
    pagamentos.first.cedente_com_dv.should eql("000289353")
    pagamentos.first.convenio.should eql("1622420")
    pagamentos.first.data_liquidacao.should eql("200109")
    pagamentos.first.data_credito.should eql("220109")
    pagamentos.first.valor_recebido.should eql("0000000009064")
    pagamentos.first.nosso_numero.should eql("16224200000000003")
  end

end