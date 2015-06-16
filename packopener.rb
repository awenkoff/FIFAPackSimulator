require 'fox16'

include Fox



$ratings = Array.new



class PackOpener < FXMainWindow

  def initialize(app)

    super(app, 'Pack Opener', :height => 1000, :width => 500)

    @mtx = FXMatrix.new(self, 3)



    btn = FXButton.new(@mtx, 'Open First Pack', :opts => BUTTON_NORMAL|LAYOUT_FIX_WIDTH|LAYOUT_FIX_HEIGHT, :width => 125, :height => 50)

    a = rand(100)

    if btn.connect(SEL_COMMAND) then

      line = IO.readlines("./players.txt")[a].to_s

      name = line.split("/t")[1].to_s

      btn = FXButton.new(@mtx, 'You got #{name}', :opts => BUTTON_NORMAL|LAYOUT_FIX_WIDTH|LAYOUT_FIX_HEIGHT, :width => 125, :height => 50)



      $ratings.push(line.split("/t")[3].to_i)

    end

  end

  def create
    super
    self.show(PLACEMENT_SCREEN)
  end

end




app = FXApp.new

5.times do

  PackOpener.new(app)

end

app.create

app.run



finalscore = $ratings[0] + $ratings[1] + $ratings[2] + $ratings[3] + $ratings[4]



# screen = FXApp.new
#
# main = FXMainWindow.new(screen, finalscore , :width => 200, :height => 50)
#
# screen.create
#
# main.show(PLACEMENT_SCREEN)
#
# screen.run