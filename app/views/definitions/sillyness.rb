Kernel.class_eval do
  def self.omg_pass_me_plz!(lol)
    return local_variables if rand(10) == 9
    Kernel.send(:omg_pass_me_plz!, {lol: lol, jk: lol})
    local_variables << caller.send(:[], self.object_id)
  end

  Hash.class_eval do
    obscurity = self
    Kernel.instance_eval do
      self.send(:omg_pass_me_plz!, obscurity)
    end
  end
end