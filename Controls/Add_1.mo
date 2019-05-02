model Add_1
  Modelica.Blocks.Interfaces.RealOutput Steer_Ang1_Output annotation(
    Placement(visible = true, transformation(origin = {174, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {174, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1 annotation(
    Placement(visible = true, transformation(origin = {-62, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Ang_Wheel_Input annotation(
    Placement(visible = true, transformation(origin = {-184, 52}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-184, 52}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Math.Asin asin1 annotation(
    Placement(visible = true, transformation(origin = {20, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add2(k1 = -1, k2 = +1)  annotation(
    Placement(visible = true, transformation(origin = {54, -14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product product1 annotation(
    Placement(visible = true, transformation(origin = {-96, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Division division1 annotation(
    Placement(visible = true, transformation(origin = {-22, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Sin sin1 annotation(
    Placement(visible = true, transformation(origin = {-138, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant dc(k = 60)  "Perpendicular distance between the camera axis and the vehicle axis" annotation(
    Placement(visible = true, transformation(origin = {-122, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Abs abs1 annotation(
    Placement(visible = true, transformation(origin = {92, -14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Sign sign1 annotation(
    Placement(visible = true, transformation(origin = {92, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product product2 annotation(
    Placement(visible = true, transformation(origin = {138, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Ang_Steer1_Input annotation(
    Placement(visible = true, transformation(origin = {-182, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-182, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Dist_to_Ball annotation(
    Placement(visible = true, transformation(origin = {-196, -48}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-196, -48}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation
  connect(division1.u2, Dist_to_Ball) annotation(
    Line(points = {{-34, -24}, {-146, -24}, {-146, -48}, {-196, -48}, {-196, -48}}, color = {0, 0, 127}));
  connect(product1.u2, Dist_to_Ball) annotation(
    Line(points = {{-108, -12}, {-162, -12}, {-162, -48}, {-196, -48}}, color = {0, 0, 127}));
  connect(sin1.u, Ang_Steer1_Input) annotation(
    Line(points = {{-150, 0}, {-182, 0}}, color = {0, 0, 127}));
  connect(product2.y, Steer_Ang1_Output) annotation(
    Line(points = {{150, -20}, {166, -20}, {166, -20}, {174, -20}}, color = {0, 0, 127}));
  connect(product2.u1, abs1.y) annotation(
    Line(points = {{126, -14}, {102, -14}, {102, -14}, {104, -14}}, color = {0, 0, 127}));
  connect(product2.u2, sign1.y) annotation(
    Line(points = {{126, -26}, {104, -26}, {104, -42}, {104, -42}}, color = {0, 0, 127}));
  connect(sign1.u, asin1.y) annotation(
    Line(points = {{80, -42}, {32, -42}, {32, -18}}, color = {0, 0, 127}));
  connect(abs1.u, add2.y) annotation(
    Line(points = {{80, -14}, {65, -14}}, color = {0, 0, 127}));
  connect(add2.u1, Ang_Wheel_Input) annotation(
    Line(points = {{42, -8}, {42, 82}, {-154, 82}, {-154, 52}, {-184, 52}}, color = {0, 0, 127}));
  connect(add2.u2, asin1.y) annotation(
    Line(points = {{42, -20}, {70.5, -20}, {70.5, -18}, {31, -18}}, color = {0, 0, 127}));
  connect(asin1.u, division1.y) annotation(
    Line(points = {{8, -18}, {-11, -18}}, color = {0, 0, 127}));
  connect(division1.u1, add1.y) annotation(
    Line(points = {{-34, -12}, {-34, 0}, {-51, 0}}, color = {0, 0, 127}));
  connect(add1.u1, dc.y) annotation(
    Line(points = {{-74, 6}, {-74, 32}, {-111, 32}}, color = {0, 0, 127}));
  connect(add1.u2, product1.y) annotation(
    Line(points = {{-74, -6}, {-85, -6}}, color = {0, 0, 127}));
  connect(product1.u1, sin1.y) annotation(
    Line(points = {{-108, 0}, {-127, 0}}, color = {0, 0, 127}));
  annotation(
    uses(Modelica(version = "3.2.2")));end Add_1;