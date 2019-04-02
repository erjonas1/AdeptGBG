model Add_1
  Modelica.Blocks.Interfaces.RealInput u annotation(
    Placement(visible = true, transformation(origin = {-140, 22}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-140, 22}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y annotation(
    Placement(visible = true, transformation(origin = {56, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {56, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1 annotation(
    Placement(visible = true, transformation(origin = {-38, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 0.1)  annotation(
    Placement(visible = true, transformation(origin = {-92, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(add1.y, y) annotation(
    Line(points = {{-26, 22}, {50, 22}, {50, 24}, {56, 24}}, color = {0, 0, 127}));
  connect(const.y, add1.u2) annotation(
    Line(points = {{-80, -18}, {-50, -18}, {-50, 16}, {-50, 16}}, color = {0, 0, 127}));
  connect(u, add1.u1) annotation(
    Line(points = {{-140, 22}, {-52, 22}, {-52, 28}, {-50, 28}}, color = {0, 0, 127}));

annotation(
    uses(Modelica(version = "3.2.2")));end Add_1;