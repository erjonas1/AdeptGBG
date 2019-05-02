model try_withDist_noinputs_2
  Modelica.Blocks.Sources.Constant Zero(k = 0)  annotation(
    Placement(visible = true, transformation(origin = {-132, 134}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant Rate_Steer(k = 0.1)  annotation(
    Placement(visible = true, transformation(origin = {-130, 74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant Veh_Speed(k = 0.5)  annotation(
    Placement(visible = true, transformation(origin = {54, -48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput Steer_Ang1_Output annotation(
    Placement(visible = true, transformation(origin = {236, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {236, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput Steer_Vel annotation(
    Placement(visible = true, transformation(origin = {-54, 74}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-54, 74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput Veh_Fwd_Vel annotation(
    Placement(visible = true, transformation(origin = {234, -74}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {234, -74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput Veh_Jerk annotation(
    Placement(visible = true, transformation(origin = {-50, 118}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-50, 118}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput Veh_Acc annotation(
    Placement(visible = true, transformation(origin = {-50, 142}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-50, 142}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.Greater greater1 annotation(
    Placement(visible = true, transformation(origin = {-34, -74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant Safety_Dist(k = 100)  "mm" annotation(
    Placement(visible = true, transformation(origin = {-166, -122}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.Switch switch1 annotation(
    Placement(visible = true, transformation(origin = {106, -74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant Zero2(k = 0)  annotation(
    Placement(visible = true, transformation(origin = {54, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Add_1 add_11 annotation(
    Placement(visible = true, transformation(origin = {-25, 25}, extent = {{-25, -25}, {25, 25}}, rotation = 0)));
  Modelica.Blocks.Sources.Sine Dist_to_ball annotation(
    Placement(visible = true, transformation(origin = {-310, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Sine Ang_steer1_input annotation(
    Placement(visible = true, transformation(origin = {-312, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Sine Ang_wheel_input annotation(
    Placement(visible = true, transformation(origin = {-312, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(add_11.Ang_Wheel_Input, Ang_wheel_input.y) annotation(
    Line(points = {{-70, 38}, {-302, 38}, {-302, 50}, {-300, 50}}, color = {0, 0, 127}));
  connect(add_11.Ang_Steer1_Input, Ang_steer1_input.y) annotation(
    Line(points = {{-70, 26}, {-300, 26}, {-300, 16}, {-300, 16}}, color = {0, 0, 127}));
  connect(greater1.u1, Dist_to_ball.y) annotation(
    Line(points = {{-46, -74}, {-300, -74}, {-300, -20}, {-298, -20}}, color = {0, 0, 127}));
  connect(add_11.Dist_to_Ball, Dist_to_ball.y) annotation(
    Line(points = {{-74, 14}, {-80, 14}, {-80, -20}, {-298, -20}, {-298, -20}}, color = {0, 0, 127}));
  connect(add_11.Steer_Ang1_Output, Steer_Ang1_Output) annotation(
    Line(points = {{30, 22}, {230, 22}, {230, 20}, {236, 20}}, color = {0, 0, 127}));
  connect(switch1.y, Veh_Fwd_Vel) annotation(
    Line(points = {{117, -74}, {234, -74}}, color = {0, 0, 127}));
  connect(Zero2.y, switch1.u3) annotation(
    Line(points = {{66, -100}, {94, -100}, {94, -82}, {94, -82}}, color = {0, 0, 127}));
  connect(Veh_Speed.y, switch1.u1) annotation(
    Line(points = {{66, -48}, {92, -48}, {92, -66}, {94, -66}}, color = {0, 0, 127}));
  connect(greater1.y, switch1.u2) annotation(
    Line(points = {{-23, -74}, {94, -74}}, color = {255, 0, 255}));
  connect(Safety_Dist.y, greater1.u2) annotation(
    Line(points = {{-155, -122}, {-46, -122}, {-46, -82}}, color = {0, 0, 127}));
  connect(Rate_Steer.y, Steer_Vel) annotation(
    Line(points = {{-118, 74}, {-62, 74}, {-62, 74}, {-54, 74}}, color = {0, 0, 127}));
  connect(Zero.y, Veh_Jerk) annotation(
    Line(points = {{-120, 134}, {-58, 134}, {-58, 118}, {-50, 118}}, color = {0, 0, 127}));
  connect(Zero.y, Veh_Acc) annotation(
    Line(points = {{-120, 134}, {-58, 134}, {-58, 142}, {-50, 142}}, color = {0, 0, 127}));
  annotation(
    uses(Modelica(version = "3.2.2")),
    Diagram);end try_withDist_noinputs_2;