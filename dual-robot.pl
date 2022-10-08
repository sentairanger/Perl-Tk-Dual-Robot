# import libraries
use Tk;
use RPi::PIGPIO ':all';

# define Pis
my $pi = RPi::PIGPIO->connect('192.168.0.10');
my $pi2 = RPi::PIGPIO->connect('192.168.0.23');
# Define the pins
$pi->set_mode(7, PI_OUTPUT);
$pi->set_mode(8, PI_OUTPUT);
$pi->set_mode(9, PI_OUTPUT);
$pi->set_mode(10, PI_OUTPUT);
$pi2->set_mode(12, PI_OUTPUT);
$pi2->set_mode(26, PI_OUTPUT);
$pi2->set_mode(13, PI_OUTPUT);
$pi2->set_mode(21, PI_OUTPUT);
$pi2->set_mode(17, PI_OUTPUT);
$pi2->set_mode(27, PI_OUTPUT);
#Define pwm variable
my $pwm = 0;

#Define windows, labels, scale and buttons
my $mw1 = new MainWindow(-background=>"aqua");
$mw1->geometry("300x300+0+0");
my $mw2 = MainWindow->new(-screen => $ARGV[0] ||= $ENV{DISPLAY}, -background=>"aqua"); 
$mw2->geometry("300x300+0+0");
my $label = $mw1-> Label(-text=>"Perl Linus Control", -font=>"courier 20 bold", -background=>'aqua') -> pack();
my $scl = $mw1-> Scale(-label=>"PWM: ",-orient=>'h', -digit=>1, -from=>0, -to=>255, -variable=>\$pwm, -background=>'aqua') -> pack();
my $button_scale = $mw1 -> Button(-text=>"Change PWM", -background=>"magenta", -command =>\&push_button) -> pack();
my $button1 = $mw1 -> Button(-text=>"^", -font=>'courier 14 bold', -background=>'yellow') ->pack(-side=> top);
my $button2 = $mw1 -> Button(-text=>"V", -font=>'courier 14 bold', -background=>'yellow') ->pack(-side=> bottom);
my $button3 = $mw1 -> Button(-text=>"<", -font=>'courier 14 bold', -background=>'yellow') ->pack(-side=> left);
my $button4 = $mw1 -> Button(-text=>">", -font=>'courier 14 bold', -background=>'yellow') ->pack(-side=> right);
my $label = $mw2-> Label(-text=>"Perl Torvalds Control", -font=>"courier 20 bold", -background=>'aqua') -> pack();
my $button5 = $mw2 -> Button(-text=>"^", -font=>'courier 14 bold', -background=>'yellow') ->pack(-side=> top);
my $button6 = $mw2 -> Button(-text=>"V", -font=>'courier 14 bold', -background=>'yellow') ->pack(-side=> bottom);
my $button7 = $mw2 -> Button(-text=>"<", -font=>'courier 14 bold', -background=>'yellow') ->pack(-side=> left);
my $button8 = $mw2 -> Button(-text=>">", -font=>'courier 14 bold', -background=>'yellow') ->pack(-side=> right);
#Bind the buttons
$button1->bind('<ButtonPress-1>' => sub { north()});
$button1->bind('<ButtonRelease-1>' => sub{ stop_two()});
$button2->bind('<ButtonPress-1>' => sub { south()});
$button2->bind('<ButtonRelease-1>' => sub{ stop_two()});
$button3->bind('<ButtonPress-1>' => sub { west()});
$button3->bind('<ButtonRelease-1>' => sub{ stop_two()});
$button4->bind('<ButtonPress-1>' => sub { east()});
$button4->bind('<ButtonRelease-1>' => sub{ stop_two()});
$button5->bind('<ButtonPress-1>' => sub { forward()});
$button5->bind('<ButtonRelease-1>' => sub{ stop()});
$button6->bind('<ButtonPress-1>' => sub { backward()});
$button6->bind('<ButtonRelease-1>' => sub{ stop()});
$button7->bind('<ButtonPress-1>' => sub { left()});
$button7->bind('<ButtonRelease-1>' => sub{ stop()});
$button8->bind('<ButtonPress-1>' => sub { right()});
$button8->bind('<ButtonRelease-1>' => sub{ stop()});
MainLoop; 

# Subroutines for direction and pwm control
sub push_button {
    $pi2->write_pwm(12, $pwm);
    $pi2->write_pwm(26, $pwm);
}

sub forward {
    $pi->write(7, LOW);
    $pi->write(8, HI);
    $pi->write(9, HI);
    $pi->write(10, LOW);

}

sub backward {
   $pi->write(7, HI);
    $pi->write(8, LOW);
    $pi->write(9, LOW);
    $pi->write(10, HI);
}

sub left {
   $pi->write(7, HI);
    $pi->write(8, LOW);
    $pi->write(9, HI);
    $pi->write(10, LOW);
}

sub right {
   $pi->write(7, LOW);
    $pi->write(8, HI);
    $pi->write(9, LOW);
    $pi->write(10, HI);
}

sub stop {
   $pi->write(7, LOW);
    $pi->write(8, LOW);
    $pi->write(9, LOW);
    $pi->write(10, LOW);
}
sub north {
    $pi2->write(13, HI);
    $pi2->write(21, LOW);
    $pi2->write(17, HI);
    $pi2->write(27, LOW);
}

sub south {
    $pi2->write(13, LOW);
    $pi2->write(21, HI);
    $pi2->write(17, LOW);
    $pi2->write(27, HI);

}

sub west {
    $pi2->write(13, LOW);
    $pi2->write(21, HI);
    $pi2->write(17, HI);
    $pi2->write(27, LOW);
}

sub east {
    $pi2->write(13, HI);
    $pi2->write(21, LOW);
    $pi2->write(17, LOW);
    $pi2->write(27, HI);
}

sub stop_two {
    $pi2->write(13, LOW);
    $pi2->write(21, LOW);
    $pi2->write(17, LOW);
    $pi2->write(27, LOW);

}
