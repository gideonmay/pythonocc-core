#!/usr/bin/env python

##Copyright 2009-2014 Jelle Ferina (jelleferinga@gmail.com)
##
##This file is part of pythonOCC.
##
##pythonOCC is free software: you can redistribute it and/or modify
##it under the terms of the GNU Lesser General Public License as published by
##the Free Software Foundation, either version 3 of the License, or
##(at your option) any later version.
##
##pythonOCC is distributed in the hope that it will be useful,
##but WITHOUT ANY WARRANTY; without even the implied warranty of
##MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##GNU Lesser General Public License for more details.
##
##You should have received a copy of the GNU Lesser General Public License
##along with pythonOCC.  If not, see <http://www.gnu.org/licenses/>.

from __future__ import print_function

from OCC.gp import gp_Pnt2d, gp_Pnt
from OCC.gp import gp_Pnt, gp_Lin, gp_Ax1, gp_Dir, gp_Elips, gp_Ax2
from OCC.TColgp import TColgp_Array1OfPnt2d
from OCC.Geom2dAPI import Geom2dAPI_PointsToBSpline
from OCC.Geom2d import Geom2d_OffsetCurve
from OCC.TColgp import TColgp_Array1OfPnt
from OCC.Geom import Geom_BezierCurve
from OCC.BRepBuilderAPI import (BRepBuilderAPI_MakeEdge,
                                BRepBuilderAPI_MakeVertex)

from OCC.Display.SimpleGui import init_display
display, start_display, add_menu, add_function_to_menu = init_display()

def bezier_from_offset(event=None):
    P1 = gp_Pnt(-15, 200, 10)
    P2 = gp_Pnt(5, 204, 0)
    P3 = gp_Pnt(15, 200, 0)
    P4 = gp_Pnt(-15, 20, 15)
    P5 = gp_Pnt(-5, 20, 0)
    P6 = gp_Pnt(15, 20, 0)
    P7 = gp_Pnt(24, 120, 0)
    P8 = gp_Pnt(-24, 120, 12.5)
    array = TColgp_Array1OfPnt(1, 8)
    array.SetValue(1, P1)
    array.SetValue(2, P2)
    array.SetValue(3, P3)
    array.SetValue(4, P4)
    array.SetValue(5, P5)
    array.SetValue(6, P6)
    array.SetValue(7, P7)
    array.SetValue(8, P8)
    curve = Geom_BezierCurve(array)
    ME = BRepBuilderAPI_MakeEdge(curve.GetHandle())
    GreenEdge = ME
    V3 = ME.Vertex1()
    V4 = ME.Vertex2()
    
    dist = 1
    offset_curve1 = Geom2d_OffsetCurve(curve.GetHandle(), dist)
    result = offset_curve1.IsCN(2)
    print("Offset curve yellow is C2: %r" % result)
    dist2 = 1.5
    offset_curve2 = Geom2d_OffsetCurve(curve.GetHandle(), dist2)
    result2 = offset_curve2.IsCN(2)
    result = offset_curve1.IsCN(2)
    print("Offset curve blue is C2: %r" % result2)

    display.DisplayShape(curve)
    display.DisplayShape(offset_curve1, color='YELLOW')
    display.DisplayShape(offset_curve2, color='BLUE', update=True)

    
    return 

def curves2d_from_offset(event=None):
    '''
    @param display:
    '''
    pnt2d_array = TColgp_Array1OfPnt2d(1, 5)
    pnt2d_array.SetValue(1, gp_Pnt2d(-4, 0))
    pnt2d_array.SetValue(2, gp_Pnt2d(-7, 2))
    pnt2d_array.SetValue(3, gp_Pnt2d(-6, 3))
    pnt2d_array.SetValue(4, gp_Pnt2d(-4, 3))
    pnt2d_array.SetValue(5, gp_Pnt2d(-3, 5))

    spline_1 = Geom2dAPI_PointsToBSpline(pnt2d_array).Curve()

    dist = 1
    offset_curve1 = Geom2d_OffsetCurve(spline_1, dist)
    result = offset_curve1.IsCN(2)
    print("Offset curve yellow is C2: %r" % result)
    dist2 = 1.5
    offset_curve2 = Geom2d_OffsetCurve(spline_1, dist2)
    result2 = offset_curve2.IsCN(2)
    result = offset_curve1.IsCN(2)
    print("Offset curve blue is C2: %r" % result2)

    display.DisplayShape(spline_1)
    display.DisplayShape(offset_curve1, color='YELLOW')
    display.DisplayShape(offset_curve2, color='BLUE', update=True)


if __name__ == '__main__':
    bezier_from_offset()
    # curves2d_from_offset()
    start_display()
