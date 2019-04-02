model try_withDist
  Modelica.Blocks.Sources.Constant Zero(k = 0)  annotation(
    Placement(visible = true, transformation(origin = {-132, 134}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant Rate_Steer(k = 0.1)  annotation(
    Placement(visible = true, transformation(origin = {-130, 74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant Veh_Speed(k = 0.5)  annotation(
    Placement(visible = true, transformation(origin = {54, -48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput Steer_Ang1_Output annotation(
    Placement(visible = true, transformation(origin = {58, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {58, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput Steer_Vel annotation(
    Placement(visible = true, transformation(origin = {-54, 74}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-54, 74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput Veh_Fwd_Vel annotation(
    Placement(visible = true, transformation(origin = {168, -74}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {168, -74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput Veh_Jerk annotation(
    Placement(visible = true, transformation(origin = {-50, 118}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-50, 118}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput Veh_Acc annotation(
    Placement(visible = true, transformation(origin = {-50, 142}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-50, 142}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Ang_Steer1_Input annotation(
    Placement(visible = true, transformation(origin = {-144, 18}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-144, 18}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Logical.Greater greater1 annotation(
    Placement(visible = true, transformation(origin = {-34, -74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant Safety_Dist(k = 100)  "mm" annotation(
    Placement(visible = true, transformation(origin = {-166, -122}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.Switch switch1 annotation(
    Placement(visible = true, transformation(origin = {106, -74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant Zero2(k = 0)  annotation(
    Placement(visible = true, transformation(origin = {54, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Dist_to_Ball annotation(
    Placement(visible = true, transformation(origin = {-172, -70}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-172, -70}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Add_1 add_11 annotation(
    Placement(visible = true, transformation(origin = {-40, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(Ang_Steer1_Input, add_11.u) annotation(
    Line(points = {{-144, 18}, {-54, 18}, {-54, 20}, {-54, 20}}, color = {0, 0, 127}));
  connect(add_11.y, Steer_Ang1_Output) annotation(
    Line(points = {{-34, 20}, {54, 20}, {54, 20}, {58, 20}}, color = {0, 0, 127}));
  connect(Dist_to_Ball, greater1.u1) annotation(
    Line(points = {{-172, -70}, {-46, -70}, {-46, -74}}, color = {0, 0, 127}));
  connect(Zero2.y, switch1.u3) annotation(
    Line(points = {{66, -100}, {94, -100}, {94, -82}, {94, -82}}, color = {0, 0, 127}));
  connect(switch1.y, Veh_Fwd_Vel) annotation(
    Line(points = {{117, -74}, {168, -74}}, color = {0, 0, 127}));
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
    Diagram);end try_withDist;