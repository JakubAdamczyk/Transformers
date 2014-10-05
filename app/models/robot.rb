require 'open-uri'

class Robot

  def initialize
    @id = 3
  end

  def lock
    open("http://192.168.0.2:1234/#{@id}/lock").read
  end

  def proximity
    open("http://192.168.0.2:1234/proximity").read
  end

  def forward
    open("http://192.168.0.2:1234/#{@id}/forward").read
  end

  def backward
    open("http://192.168.0.2:1234/#{@id}/backward").read
  end

  def slow_forward
    open("http://192.168.0.2:1234/#{@id}/slow_forward").read
  end

  def slow_backward
    open("http://192.168.0.2:1234/#{@id}/slow_backward").read
  end

  def left
    open("http://192.168.0.2:1234/#{@id}/left").read
  end

  def right
    open("http://192.168.0.2:1234/#{@id}/right").read
  end

  def run
    open("http://192.168.0.2:1234/#{@id}/run").read
  end

  def attack
    open("http://192.168.0.2:1234/#{@id}/attack").read
  end

end