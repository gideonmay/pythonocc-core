/*
Copyright 2008-2015 Thomas Paviot (tpaviot@gmail.com)


This file is part of pythonOCC.
pythonOCC is free software: you can redistribute it and/or modify
it under the terms of the GNU Lesser General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

pythonOCC is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License
along with pythonOCC.  If not, see <http://www.gnu.org/licenses/>.

*/
%{
#include<GeomToStep_MakeAxis1Placement.hxx>
#include<GeomToStep_MakeAxis2Placement2d.hxx>
#include<GeomToStep_MakeAxis2Placement3d.hxx>
#include<GeomToStep_MakeBoundedCurve.hxx>
#include<GeomToStep_MakeBoundedSurface.hxx>
#include<GeomToStep_MakeBSplineCurveWithKnots.hxx>
#include<GeomToStep_MakeBSplineCurveWithKnotsAndRationalBSplineCurve.hxx>
#include<GeomToStep_MakeBSplineSurfaceWithKnots.hxx>
#include<GeomToStep_MakeBSplineSurfaceWithKnotsAndRationalBSplineSurface.hxx>
#include<GeomToStep_MakeCartesianPoint.hxx>
#include<GeomToStep_MakeCircle.hxx>
#include<GeomToStep_MakeConic.hxx>
#include<GeomToStep_MakeConicalSurface.hxx>
#include<GeomToStep_MakeCurve.hxx>
#include<GeomToStep_MakeCylindricalSurface.hxx>
#include<GeomToStep_MakeDirection.hxx>
#include<GeomToStep_MakeElementarySurface.hxx>
#include<GeomToStep_MakeEllipse.hxx>
#include<GeomToStep_MakeHyperbola.hxx>
#include<GeomToStep_MakeLine.hxx>
#include<GeomToStep_MakeParabola.hxx>
#include<GeomToStep_MakePlane.hxx>
#include<GeomToStep_MakePolyline.hxx>
#include<GeomToStep_MakeRectangularTrimmedSurface.hxx>
#include<GeomToStep_MakeSphericalSurface.hxx>
#include<GeomToStep_MakeSurface.hxx>
#include<GeomToStep_MakeSurfaceOfLinearExtrusion.hxx>
#include<GeomToStep_MakeSurfaceOfRevolution.hxx>
#include<GeomToStep_MakeSweptSurface.hxx>
#include<GeomToStep_MakeToroidalSurface.hxx>
#include<GeomToStep_MakeVector.hxx>
#include<GeomToStep_Root.hxx>
#include<Standard.hxx>
#include<Standard_AbortiveTransaction.hxx>
#include<Standard_Address.hxx>
#include<Standard_AncestorIterator.hxx>
#include<Standard_Assert.hxx>
#include<Standard_Atomic.hxx>
#include<Standard_Boolean.hxx>
#include<Standard_Byte.hxx>
#include<Standard_Character.hxx>
#include<Standard_ConstructionError.hxx>
#include<Standard_CString.hxx>
#include<Standard_DefineAlloc.hxx>
#include<Standard_DefineException.hxx>
#include<Standard_DefineHandle.hxx>
#include<Standard_DimensionError.hxx>
#include<Standard_DimensionMismatch.hxx>
#include<Standard_DivideByZero.hxx>
#include<Standard_DomainError.hxx>
#include<Standard_ErrorHandler.hxx>
#include<Standard_ErrorHandlerCallback.hxx>
#include<Standard_ExtCharacter.hxx>
#include<Standard_ExtString.hxx>
#include<Standard_Failure.hxx>
#include<Standard_GUID.hxx>
#include<Standard_HandlerStatus.hxx>
#include<Standard_ImmutableObject.hxx>
#include<Standard_Integer.hxx>
#include<Standard_InternalType.hxx>
#include<Standard_IStream.hxx>
#include<Standard_JmpBuf.hxx>
#include<Standard_KindOfType.hxx>
#include<Standard_LicenseError.hxx>
#include<Standard_LicenseNotFound.hxx>
#include<Standard_Macro.hxx>
#include<Standard_math.hxx>
#include<Standard_MMgrOpt.hxx>
#include<Standard_MMgrRaw.hxx>
#include<Standard_MMgrRoot.hxx>
#include<Standard_MMgrTBBalloc.hxx>
#include<Standard_MultiplyDefined.hxx>
#include<Standard_Mutex.hxx>
#include<Standard_NegativeValue.hxx>
#include<Standard_NoMoreObject.hxx>
#include<Standard_NoSuchObject.hxx>
#include<Standard_NotImplemented.hxx>
#include<Standard_NullObject.hxx>
#include<Standard_NullValue.hxx>
#include<Standard_NumericError.hxx>
#include<Standard_OStream.hxx>
#include<Standard_OutOfMemory.hxx>
#include<Standard_OutOfRange.hxx>
#include<Standard_Overflow.hxx>
#include<Standard_PByte.hxx>
#include<Standard_PCharacter.hxx>
#include<Standard_PErrorHandler.hxx>
#include<Standard_Persistent.hxx>
#include<Standard_Persistent_proto.hxx>
#include<Standard_PExtCharacter.hxx>
#include<Standard_PrimitiveTypes.hxx>
#include<Standard_ProgramError.hxx>
#include<Standard_RangeError.hxx>
#include<Standard_Real.hxx>
#include<Standard_ShortReal.hxx>
#include<Standard_Size.hxx>
#include<Standard_SStream.hxx>
#include<Standard_Storable.hxx>
#include<Standard_Stream.hxx>
#include<Standard_ThreadId.hxx>
#include<Standard_Time.hxx>
#include<Standard_TooManyUsers.hxx>
#include<Standard_Transient.hxx>
#include<Standard_Transient_proto.hxx>
#include<Standard_Type.hxx>
#include<Standard_TypeDef.hxx>
#include<Standard_TypeMismatch.hxx>
#include<Standard_Underflow.hxx>
#include<Standard_UUID.hxx>
#include<Standard_Version.hxx>
#include<Standard_WayOfLife.hxx>
#include<Standard_values.h>
#include<gp.hxx>
#include<gp_Ax1.hxx>
#include<gp_Ax2.hxx>
#include<gp_Ax22d.hxx>
#include<gp_Ax2d.hxx>
#include<gp_Ax3.hxx>
#include<gp_Circ.hxx>
#include<gp_Circ2d.hxx>
#include<gp_Cone.hxx>
#include<gp_Cylinder.hxx>
#include<gp_Dir.hxx>
#include<gp_Dir2d.hxx>
#include<gp_Elips.hxx>
#include<gp_Elips2d.hxx>
#include<gp_EulerSequence.hxx>
#include<gp_GTrsf.hxx>
#include<gp_GTrsf2d.hxx>
#include<gp_Hypr.hxx>
#include<gp_Hypr2d.hxx>
#include<gp_Lin.hxx>
#include<gp_Lin2d.hxx>
#include<gp_Mat.hxx>
#include<gp_Mat2d.hxx>
#include<gp_Parab.hxx>
#include<gp_Parab2d.hxx>
#include<gp_Pln.hxx>
#include<gp_Pnt.hxx>
#include<gp_Pnt2d.hxx>
#include<gp_Quaternion.hxx>
#include<gp_QuaternionNLerp.hxx>
#include<gp_QuaternionSLerp.hxx>
#include<gp_Sphere.hxx>
#include<gp_Torus.hxx>
#include<gp_Trsf.hxx>
#include<gp_Trsf2d.hxx>
#include<gp_TrsfForm.hxx>
#include<gp_Vec.hxx>
#include<gp_Vec2d.hxx>
#include<gp_VectorWithNullMagnitude.hxx>
#include<gp_XY.hxx>
#include<gp_XYZ.hxx>
#include<Geom_Axis1Placement.hxx>
#include<Geom_Axis2Placement.hxx>
#include<Geom_AxisPlacement.hxx>
#include<Geom_BezierCurve.hxx>
#include<Geom_BezierSurface.hxx>
#include<Geom_BoundedCurve.hxx>
#include<Geom_BoundedSurface.hxx>
#include<Geom_BSplineCurve.hxx>
#include<Geom_BSplineSurface.hxx>
#include<Geom_CartesianPoint.hxx>
#include<Geom_Circle.hxx>
#include<Geom_Conic.hxx>
#include<Geom_ConicalSurface.hxx>
#include<Geom_Curve.hxx>
#include<Geom_CylindricalSurface.hxx>
#include<Geom_Direction.hxx>
#include<Geom_ElementarySurface.hxx>
#include<Geom_Ellipse.hxx>
#include<Geom_Geometry.hxx>
#include<Geom_HSequenceOfBSplineSurface.hxx>
#include<Geom_Hyperbola.hxx>
#include<Geom_Line.hxx>
#include<Geom_OffsetCurve.hxx>
#include<Geom_OffsetSurface.hxx>
#include<Geom_OsculatingSurface.hxx>
#include<Geom_Parabola.hxx>
#include<Geom_Plane.hxx>
#include<Geom_Point.hxx>
#include<Geom_RectangularTrimmedSurface.hxx>
#include<Geom_SequenceNodeOfSequenceOfBSplineSurface.hxx>
#include<Geom_SequenceOfBSplineSurface.hxx>
#include<Geom_SphericalSurface.hxx>
#include<Geom_Surface.hxx>
#include<Geom_SurfaceOfLinearExtrusion.hxx>
#include<Geom_SurfaceOfRevolution.hxx>
#include<Geom_SweptSurface.hxx>
#include<Geom_ToroidalSurface.hxx>
#include<Geom_Transformation.hxx>
#include<Geom_TrimmedCurve.hxx>
#include<Geom_UndefinedDerivative.hxx>
#include<Geom_UndefinedValue.hxx>
#include<Geom_Vector.hxx>
#include<Geom_VectorWithMagnitude.hxx>
#include<Geom2d_AxisPlacement.hxx>
#include<Geom2d_BezierCurve.hxx>
#include<Geom2d_BoundedCurve.hxx>
#include<Geom2d_BSplineCurve.hxx>
#include<Geom2d_CartesianPoint.hxx>
#include<Geom2d_Circle.hxx>
#include<Geom2d_Conic.hxx>
#include<Geom2d_Curve.hxx>
#include<Geom2d_Direction.hxx>
#include<Geom2d_Ellipse.hxx>
#include<Geom2d_Geometry.hxx>
#include<Geom2d_Hyperbola.hxx>
#include<Geom2d_Line.hxx>
#include<Geom2d_OffsetCurve.hxx>
#include<Geom2d_Parabola.hxx>
#include<Geom2d_Point.hxx>
#include<Geom2d_Transformation.hxx>
#include<Geom2d_TrimmedCurve.hxx>
#include<Geom2d_UndefinedDerivative.hxx>
#include<Geom2d_UndefinedValue.hxx>
#include<Geom2d_Vector.hxx>
#include<Geom2d_VectorWithMagnitude.hxx>
#include<StepGeom_Array1OfBoundaryCurve.hxx>
#include<StepGeom_Array1OfCartesianPoint.hxx>
#include<StepGeom_Array1OfCompositeCurveSegment.hxx>
#include<StepGeom_Array1OfCurve.hxx>
#include<StepGeom_Array1OfPcurveOrSurface.hxx>
#include<StepGeom_Array1OfSurfaceBoundary.hxx>
#include<StepGeom_Array1OfTrimmingSelect.hxx>
#include<StepGeom_Array2OfCartesianPoint.hxx>
#include<StepGeom_Array2OfSurfacePatch.hxx>
#include<StepGeom_Axis1Placement.hxx>
#include<StepGeom_Axis2Placement.hxx>
#include<StepGeom_Axis2Placement2d.hxx>
#include<StepGeom_Axis2Placement3d.hxx>
#include<StepGeom_BezierCurve.hxx>
#include<StepGeom_BezierCurveAndRationalBSplineCurve.hxx>
#include<StepGeom_BezierSurface.hxx>
#include<StepGeom_BezierSurfaceAndRationalBSplineSurface.hxx>
#include<StepGeom_BoundaryCurve.hxx>
#include<StepGeom_BoundedCurve.hxx>
#include<StepGeom_BoundedSurface.hxx>
#include<StepGeom_BSplineCurve.hxx>
#include<StepGeom_BSplineCurveForm.hxx>
#include<StepGeom_BSplineCurveWithKnots.hxx>
#include<StepGeom_BSplineCurveWithKnotsAndRationalBSplineCurve.hxx>
#include<StepGeom_BSplineSurface.hxx>
#include<StepGeom_BSplineSurfaceForm.hxx>
#include<StepGeom_BSplineSurfaceWithKnots.hxx>
#include<StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface.hxx>
#include<StepGeom_CartesianPoint.hxx>
#include<StepGeom_CartesianTransformationOperator.hxx>
#include<StepGeom_CartesianTransformationOperator2d.hxx>
#include<StepGeom_CartesianTransformationOperator3d.hxx>
#include<StepGeom_Circle.hxx>
#include<StepGeom_CompositeCurve.hxx>
#include<StepGeom_CompositeCurveOnSurface.hxx>
#include<StepGeom_CompositeCurveSegment.hxx>
#include<StepGeom_Conic.hxx>
#include<StepGeom_ConicalSurface.hxx>
#include<StepGeom_Curve.hxx>
#include<StepGeom_CurveBoundedSurface.hxx>
#include<StepGeom_CurveOnSurface.hxx>
#include<StepGeom_CurveReplica.hxx>
#include<StepGeom_CylindricalSurface.hxx>
#include<StepGeom_DegeneratePcurve.hxx>
#include<StepGeom_DegenerateToroidalSurface.hxx>
#include<StepGeom_Direction.hxx>
#include<StepGeom_ElementarySurface.hxx>
#include<StepGeom_Ellipse.hxx>
#include<StepGeom_EvaluatedDegeneratePcurve.hxx>
#include<StepGeom_GeometricRepresentationContext.hxx>
#include<StepGeom_GeometricRepresentationContextAndGlobalUnitAssignedContext.hxx>
#include<StepGeom_GeometricRepresentationContextAndParametricRepresentationContext.hxx>
#include<StepGeom_GeometricRepresentationItem.hxx>
#include<StepGeom_GeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx.hxx>
#include<StepGeom_HArray1OfBoundaryCurve.hxx>
#include<StepGeom_HArray1OfCartesianPoint.hxx>
#include<StepGeom_HArray1OfCompositeCurveSegment.hxx>
#include<StepGeom_HArray1OfCurve.hxx>
#include<StepGeom_HArray1OfPcurveOrSurface.hxx>
#include<StepGeom_HArray1OfSurfaceBoundary.hxx>
#include<StepGeom_HArray1OfTrimmingSelect.hxx>
#include<StepGeom_HArray2OfCartesianPoint.hxx>
#include<StepGeom_HArray2OfSurfacePatch.hxx>
#include<StepGeom_Hyperbola.hxx>
#include<StepGeom_IntersectionCurve.hxx>
#include<StepGeom_KnotType.hxx>
#include<StepGeom_Line.hxx>
#include<StepGeom_OffsetCurve3d.hxx>
#include<StepGeom_OffsetSurface.hxx>
#include<StepGeom_OrientedSurface.hxx>
#include<StepGeom_OuterBoundaryCurve.hxx>
#include<StepGeom_Parabola.hxx>
#include<StepGeom_Pcurve.hxx>
#include<StepGeom_PcurveOrSurface.hxx>
#include<StepGeom_Placement.hxx>
#include<StepGeom_Plane.hxx>
#include<StepGeom_Point.hxx>
#include<StepGeom_PointOnCurve.hxx>
#include<StepGeom_PointOnSurface.hxx>
#include<StepGeom_PointReplica.hxx>
#include<StepGeom_Polyline.hxx>
#include<StepGeom_PreferredSurfaceCurveRepresentation.hxx>
#include<StepGeom_QuasiUniformCurve.hxx>
#include<StepGeom_QuasiUniformCurveAndRationalBSplineCurve.hxx>
#include<StepGeom_QuasiUniformSurface.hxx>
#include<StepGeom_QuasiUniformSurfaceAndRationalBSplineSurface.hxx>
#include<StepGeom_RationalBSplineCurve.hxx>
#include<StepGeom_RationalBSplineSurface.hxx>
#include<StepGeom_RectangularCompositeSurface.hxx>
#include<StepGeom_RectangularTrimmedSurface.hxx>
#include<StepGeom_ReparametrisedCompositeCurveSegment.hxx>
#include<StepGeom_SeamCurve.hxx>
#include<StepGeom_SphericalSurface.hxx>
#include<StepGeom_Surface.hxx>
#include<StepGeom_SurfaceBoundary.hxx>
#include<StepGeom_SurfaceCurve.hxx>
#include<StepGeom_SurfaceCurveAndBoundedCurve.hxx>
#include<StepGeom_SurfaceOfLinearExtrusion.hxx>
#include<StepGeom_SurfaceOfRevolution.hxx>
#include<StepGeom_SurfacePatch.hxx>
#include<StepGeom_SurfaceReplica.hxx>
#include<StepGeom_SweptSurface.hxx>
#include<StepGeom_ToroidalSurface.hxx>
#include<StepGeom_TransitionCode.hxx>
#include<StepGeom_TrimmedCurve.hxx>
#include<StepGeom_TrimmingMember.hxx>
#include<StepGeom_TrimmingPreference.hxx>
#include<StepGeom_TrimmingSelect.hxx>
#include<StepGeom_UniformCurve.hxx>
#include<StepGeom_UniformCurveAndRationalBSplineCurve.hxx>
#include<StepGeom_UniformSurface.hxx>
#include<StepGeom_UniformSurfaceAndRationalBSplineSurface.hxx>
#include<StepGeom_Vector.hxx>
#include<StepGeom_VectorOrDirection.hxx>
#include<TColgp_Array1OfCirc2d.hxx>
#include<TColgp_Array1OfDir.hxx>
#include<TColgp_Array1OfDir2d.hxx>
#include<TColgp_Array1OfLin2d.hxx>
#include<TColgp_Array1OfPnt.hxx>
#include<TColgp_Array1OfPnt2d.hxx>
#include<TColgp_Array1OfVec.hxx>
#include<TColgp_Array1OfVec2d.hxx>
#include<TColgp_Array1OfXY.hxx>
#include<TColgp_Array1OfXYZ.hxx>
#include<TColgp_Array2OfCirc2d.hxx>
#include<TColgp_Array2OfDir.hxx>
#include<TColgp_Array2OfDir2d.hxx>
#include<TColgp_Array2OfLin2d.hxx>
#include<TColgp_Array2OfPnt.hxx>
#include<TColgp_Array2OfPnt2d.hxx>
#include<TColgp_Array2OfVec.hxx>
#include<TColgp_Array2OfVec2d.hxx>
#include<TColgp_Array2OfXY.hxx>
#include<TColgp_Array2OfXYZ.hxx>
#include<TColgp_HArray1OfCirc2d.hxx>
#include<TColgp_HArray1OfDir.hxx>
#include<TColgp_HArray1OfDir2d.hxx>
#include<TColgp_HArray1OfLin2d.hxx>
#include<TColgp_HArray1OfPnt.hxx>
#include<TColgp_HArray1OfPnt2d.hxx>
#include<TColgp_HArray1OfVec.hxx>
#include<TColgp_HArray1OfVec2d.hxx>
#include<TColgp_HArray1OfXY.hxx>
#include<TColgp_HArray1OfXYZ.hxx>
#include<TColgp_HArray2OfCirc2d.hxx>
#include<TColgp_HArray2OfDir.hxx>
#include<TColgp_HArray2OfDir2d.hxx>
#include<TColgp_HArray2OfLin2d.hxx>
#include<TColgp_HArray2OfPnt.hxx>
#include<TColgp_HArray2OfPnt2d.hxx>
#include<TColgp_HArray2OfVec.hxx>
#include<TColgp_HArray2OfVec2d.hxx>
#include<TColgp_HArray2OfXY.hxx>
#include<TColgp_HArray2OfXYZ.hxx>
#include<TColgp_HSequenceOfDir.hxx>
#include<TColgp_HSequenceOfDir2d.hxx>
#include<TColgp_HSequenceOfPnt.hxx>
#include<TColgp_HSequenceOfPnt2d.hxx>
#include<TColgp_HSequenceOfVec.hxx>
#include<TColgp_HSequenceOfVec2d.hxx>
#include<TColgp_HSequenceOfXY.hxx>
#include<TColgp_HSequenceOfXYZ.hxx>
#include<TColgp_SequenceNodeOfSequenceOfArray1OfPnt2d.hxx>
#include<TColgp_SequenceNodeOfSequenceOfDir.hxx>
#include<TColgp_SequenceNodeOfSequenceOfDir2d.hxx>
#include<TColgp_SequenceNodeOfSequenceOfPnt.hxx>
#include<TColgp_SequenceNodeOfSequenceOfPnt2d.hxx>
#include<TColgp_SequenceNodeOfSequenceOfVec.hxx>
#include<TColgp_SequenceNodeOfSequenceOfVec2d.hxx>
#include<TColgp_SequenceNodeOfSequenceOfXY.hxx>
#include<TColgp_SequenceNodeOfSequenceOfXYZ.hxx>
#include<TColgp_SequenceOfArray1OfPnt2d.hxx>
#include<TColgp_SequenceOfDir.hxx>
#include<TColgp_SequenceOfDir2d.hxx>
#include<TColgp_SequenceOfPnt.hxx>
#include<TColgp_SequenceOfPnt2d.hxx>
#include<TColgp_SequenceOfVec.hxx>
#include<TColgp_SequenceOfVec2d.hxx>
#include<TColgp_SequenceOfXY.hxx>
#include<TColgp_SequenceOfXYZ.hxx>
#include<Message.hxx>
#include<Message_Algorithm.hxx>
#include<Message_ExecStatus.hxx>
#include<Message_Gravity.hxx>
#include<Message_HArrayOfMsg.hxx>
#include<Message_ListIteratorOfListOfMsg.hxx>
#include<Message_ListNodeOfListOfMsg.hxx>
#include<Message_ListOfMsg.hxx>
#include<Message_Messenger.hxx>
#include<Message_Msg.hxx>
#include<Message_MsgFile.hxx>
#include<Message_Printer.hxx>
#include<Message_PrinterOStream.hxx>
#include<Message_ProgressIndicator.hxx>
#include<Message_ProgressScale.hxx>
#include<Message_ProgressSentry.hxx>
#include<Message_SequenceNodeOfSequenceOfPrinters.hxx>
#include<Message_SequenceNodeOfSequenceOfProgressScale.hxx>
#include<Message_SequenceOfPrinters.hxx>
#include<Message_SequenceOfProgressScale.hxx>
#include<Message_Status.hxx>
#include<Message_StatusType.hxx>
#include<StepBasic_Action.hxx>
#include<StepBasic_ActionAssignment.hxx>
#include<StepBasic_ActionMethod.hxx>
#include<StepBasic_ActionRequestAssignment.hxx>
#include<StepBasic_ActionRequestSolution.hxx>
#include<StepBasic_Address.hxx>
#include<StepBasic_AheadOrBehind.hxx>
#include<StepBasic_ApplicationContext.hxx>
#include<StepBasic_ApplicationContextElement.hxx>
#include<StepBasic_ApplicationProtocolDefinition.hxx>
#include<StepBasic_Approval.hxx>
#include<StepBasic_ApprovalAssignment.hxx>
#include<StepBasic_ApprovalDateTime.hxx>
#include<StepBasic_ApprovalPersonOrganization.hxx>
#include<StepBasic_ApprovalRelationship.hxx>
#include<StepBasic_ApprovalRole.hxx>
#include<StepBasic_ApprovalStatus.hxx>
#include<StepBasic_AreaUnit.hxx>
#include<StepBasic_Array1OfApproval.hxx>
#include<StepBasic_Array1OfDerivedUnitElement.hxx>
#include<StepBasic_Array1OfDocument.hxx>
#include<StepBasic_Array1OfNamedUnit.hxx>
#include<StepBasic_Array1OfOrganization.hxx>
#include<StepBasic_Array1OfPerson.hxx>
#include<StepBasic_Array1OfProduct.hxx>
#include<StepBasic_Array1OfProductContext.hxx>
#include<StepBasic_Array1OfProductDefinition.hxx>
#include<StepBasic_Array1OfUncertaintyMeasureWithUnit.hxx>
#include<StepBasic_CalendarDate.hxx>
#include<StepBasic_Certification.hxx>
#include<StepBasic_CertificationAssignment.hxx>
#include<StepBasic_CertificationType.hxx>
#include<StepBasic_CharacterizedObject.hxx>
#include<StepBasic_Contract.hxx>
#include<StepBasic_ContractAssignment.hxx>
#include<StepBasic_ContractType.hxx>
#include<StepBasic_ConversionBasedUnit.hxx>
#include<StepBasic_ConversionBasedUnitAndAreaUnit.hxx>
#include<StepBasic_ConversionBasedUnitAndLengthUnit.hxx>
#include<StepBasic_ConversionBasedUnitAndMassUnit.hxx>
#include<StepBasic_ConversionBasedUnitAndPlaneAngleUnit.hxx>
#include<StepBasic_ConversionBasedUnitAndRatioUnit.hxx>
#include<StepBasic_ConversionBasedUnitAndSolidAngleUnit.hxx>
#include<StepBasic_ConversionBasedUnitAndTimeUnit.hxx>
#include<StepBasic_ConversionBasedUnitAndVolumeUnit.hxx>
#include<StepBasic_CoordinatedUniversalTimeOffset.hxx>
#include<StepBasic_Date.hxx>
#include<StepBasic_DateAndTime.hxx>
#include<StepBasic_DateAndTimeAssignment.hxx>
#include<StepBasic_DateAssignment.hxx>
#include<StepBasic_DateRole.hxx>
#include<StepBasic_DateTimeRole.hxx>
#include<StepBasic_DateTimeSelect.hxx>
#include<StepBasic_DerivedUnit.hxx>
#include<StepBasic_DerivedUnitElement.hxx>
#include<StepBasic_DesignContext.hxx>
#include<StepBasic_DigitalDocument.hxx>
#include<StepBasic_DimensionalExponents.hxx>
#include<StepBasic_Document.hxx>
#include<StepBasic_DocumentFile.hxx>
#include<StepBasic_DocumentProductAssociation.hxx>
#include<StepBasic_DocumentProductEquivalence.hxx>
#include<StepBasic_DocumentReference.hxx>
#include<StepBasic_DocumentRelationship.hxx>
#include<StepBasic_DocumentRepresentationType.hxx>
#include<StepBasic_DocumentType.hxx>
#include<StepBasic_DocumentUsageConstraint.hxx>
#include<StepBasic_Effectivity.hxx>
#include<StepBasic_EffectivityAssignment.hxx>
#include<StepBasic_EulerAngles.hxx>
#include<StepBasic_ExternalIdentificationAssignment.hxx>
#include<StepBasic_ExternallyDefinedItem.hxx>
#include<StepBasic_ExternalSource.hxx>
#include<StepBasic_GeneralProperty.hxx>
#include<StepBasic_Group.hxx>
#include<StepBasic_GroupAssignment.hxx>
#include<StepBasic_GroupRelationship.hxx>
#include<StepBasic_HArray1OfApproval.hxx>
#include<StepBasic_HArray1OfDerivedUnitElement.hxx>
#include<StepBasic_HArray1OfDocument.hxx>
#include<StepBasic_HArray1OfNamedUnit.hxx>
#include<StepBasic_HArray1OfOrganization.hxx>
#include<StepBasic_HArray1OfPerson.hxx>
#include<StepBasic_HArray1OfProduct.hxx>
#include<StepBasic_HArray1OfProductContext.hxx>
#include<StepBasic_HArray1OfProductDefinition.hxx>
#include<StepBasic_HArray1OfUncertaintyMeasureWithUnit.hxx>
#include<StepBasic_IdentificationAssignment.hxx>
#include<StepBasic_IdentificationRole.hxx>
#include<StepBasic_LengthMeasureWithUnit.hxx>
#include<StepBasic_LengthUnit.hxx>
#include<StepBasic_LocalTime.hxx>
#include<StepBasic_MassMeasureWithUnit.hxx>
#include<StepBasic_MassUnit.hxx>
#include<StepBasic_MeasureValueMember.hxx>
#include<StepBasic_MeasureWithUnit.hxx>
#include<StepBasic_MechanicalContext.hxx>
#include<StepBasic_NameAssignment.hxx>
#include<StepBasic_NamedUnit.hxx>
#include<StepBasic_ObjectRole.hxx>
#include<StepBasic_OrdinalDate.hxx>
#include<StepBasic_Organization.hxx>
#include<StepBasic_OrganizationalAddress.hxx>
#include<StepBasic_OrganizationAssignment.hxx>
#include<StepBasic_OrganizationRole.hxx>
#include<StepBasic_Person.hxx>
#include<StepBasic_PersonalAddress.hxx>
#include<StepBasic_PersonAndOrganization.hxx>
#include<StepBasic_PersonAndOrganizationAssignment.hxx>
#include<StepBasic_PersonAndOrganizationRole.hxx>
#include<StepBasic_PersonOrganizationSelect.hxx>
#include<StepBasic_PhysicallyModeledProductDefinition.hxx>
#include<StepBasic_PlaneAngleMeasureWithUnit.hxx>
#include<StepBasic_PlaneAngleUnit.hxx>
#include<StepBasic_Product.hxx>
#include<StepBasic_ProductCategory.hxx>
#include<StepBasic_ProductCategoryRelationship.hxx>
#include<StepBasic_ProductConceptContext.hxx>
#include<StepBasic_ProductContext.hxx>
#include<StepBasic_ProductDefinition.hxx>
#include<StepBasic_ProductDefinitionContext.hxx>
#include<StepBasic_ProductDefinitionEffectivity.hxx>
#include<StepBasic_ProductDefinitionFormation.hxx>
#include<StepBasic_ProductDefinitionFormationRelationship.hxx>
#include<StepBasic_ProductDefinitionFormationWithSpecifiedSource.hxx>
#include<StepBasic_ProductDefinitionRelationship.hxx>
#include<StepBasic_ProductDefinitionWithAssociatedDocuments.hxx>
#include<StepBasic_ProductOrFormationOrDefinition.hxx>
#include<StepBasic_ProductRelatedProductCategory.hxx>
#include<StepBasic_ProductType.hxx>
#include<StepBasic_RatioMeasureWithUnit.hxx>
#include<StepBasic_RatioUnit.hxx>
#include<StepBasic_RoleAssociation.hxx>
#include<StepBasic_RoleSelect.hxx>
#include<StepBasic_SecurityClassification.hxx>
#include<StepBasic_SecurityClassificationAssignment.hxx>
#include<StepBasic_SecurityClassificationLevel.hxx>
#include<StepBasic_SiPrefix.hxx>
#include<StepBasic_SiUnit.hxx>
#include<StepBasic_SiUnitAndAreaUnit.hxx>
#include<StepBasic_SiUnitAndLengthUnit.hxx>
#include<StepBasic_SiUnitAndMassUnit.hxx>
#include<StepBasic_SiUnitAndPlaneAngleUnit.hxx>
#include<StepBasic_SiUnitAndRatioUnit.hxx>
#include<StepBasic_SiUnitAndSolidAngleUnit.hxx>
#include<StepBasic_SiUnitAndThermodynamicTemperatureUnit.hxx>
#include<StepBasic_SiUnitAndTimeUnit.hxx>
#include<StepBasic_SiUnitAndVolumeUnit.hxx>
#include<StepBasic_SiUnitName.hxx>
#include<StepBasic_SizeMember.hxx>
#include<StepBasic_SizeSelect.hxx>
#include<StepBasic_SolidAngleMeasureWithUnit.hxx>
#include<StepBasic_SolidAngleUnit.hxx>
#include<StepBasic_Source.hxx>
#include<StepBasic_SourceItem.hxx>
#include<StepBasic_ThermodynamicTemperatureUnit.hxx>
#include<StepBasic_TimeMeasureWithUnit.hxx>
#include<StepBasic_TimeUnit.hxx>
#include<StepBasic_UncertaintyMeasureWithUnit.hxx>
#include<StepBasic_Unit.hxx>
#include<StepBasic_VersionedActionRequest.hxx>
#include<StepBasic_VolumeUnit.hxx>
#include<StepBasic_WeekOfYearAndDayDate.hxx>
#include<TColgp_Array1OfCirc2d.hxx>
#include<TColgp_Array1OfDir.hxx>
#include<TColgp_Array1OfDir2d.hxx>
#include<TColgp_Array1OfLin2d.hxx>
#include<TColgp_Array1OfPnt.hxx>
#include<TColgp_Array1OfPnt2d.hxx>
#include<TColgp_Array1OfVec.hxx>
#include<TColgp_Array1OfVec2d.hxx>
#include<TColgp_Array1OfXY.hxx>
#include<TColgp_Array1OfXYZ.hxx>
#include<TColgp_Array2OfCirc2d.hxx>
#include<TColgp_Array2OfDir.hxx>
#include<TColgp_Array2OfDir2d.hxx>
#include<TColgp_Array2OfLin2d.hxx>
#include<TColgp_Array2OfPnt.hxx>
#include<TColgp_Array2OfPnt2d.hxx>
#include<TColgp_Array2OfVec.hxx>
#include<TColgp_Array2OfVec2d.hxx>
#include<TColgp_Array2OfXY.hxx>
#include<TColgp_Array2OfXYZ.hxx>
#include<TColgp_HArray1OfCirc2d.hxx>
#include<TColgp_HArray1OfDir.hxx>
#include<TColgp_HArray1OfDir2d.hxx>
#include<TColgp_HArray1OfLin2d.hxx>
#include<TColgp_HArray1OfPnt.hxx>
#include<TColgp_HArray1OfPnt2d.hxx>
#include<TColgp_HArray1OfVec.hxx>
#include<TColgp_HArray1OfVec2d.hxx>
#include<TColgp_HArray1OfXY.hxx>
#include<TColgp_HArray1OfXYZ.hxx>
#include<TColgp_HArray2OfCirc2d.hxx>
#include<TColgp_HArray2OfDir.hxx>
#include<TColgp_HArray2OfDir2d.hxx>
#include<TColgp_HArray2OfLin2d.hxx>
#include<TColgp_HArray2OfPnt.hxx>
#include<TColgp_HArray2OfPnt2d.hxx>
#include<TColgp_HArray2OfVec.hxx>
#include<TColgp_HArray2OfVec2d.hxx>
#include<TColgp_HArray2OfXY.hxx>
#include<TColgp_HArray2OfXYZ.hxx>
#include<TColgp_HSequenceOfDir.hxx>
#include<TColgp_HSequenceOfDir2d.hxx>
#include<TColgp_HSequenceOfPnt.hxx>
#include<TColgp_HSequenceOfPnt2d.hxx>
#include<TColgp_HSequenceOfVec.hxx>
#include<TColgp_HSequenceOfVec2d.hxx>
#include<TColgp_HSequenceOfXY.hxx>
#include<TColgp_HSequenceOfXYZ.hxx>
#include<TColgp_SequenceNodeOfSequenceOfArray1OfPnt2d.hxx>
#include<TColgp_SequenceNodeOfSequenceOfDir.hxx>
#include<TColgp_SequenceNodeOfSequenceOfDir2d.hxx>
#include<TColgp_SequenceNodeOfSequenceOfPnt.hxx>
#include<TColgp_SequenceNodeOfSequenceOfPnt2d.hxx>
#include<TColgp_SequenceNodeOfSequenceOfVec.hxx>
#include<TColgp_SequenceNodeOfSequenceOfVec2d.hxx>
#include<TColgp_SequenceNodeOfSequenceOfXY.hxx>
#include<TColgp_SequenceNodeOfSequenceOfXYZ.hxx>
#include<TColgp_SequenceOfArray1OfPnt2d.hxx>
#include<TColgp_SequenceOfDir.hxx>
#include<TColgp_SequenceOfDir2d.hxx>
#include<TColgp_SequenceOfPnt.hxx>
#include<TColgp_SequenceOfPnt2d.hxx>
#include<TColgp_SequenceOfVec.hxx>
#include<TColgp_SequenceOfVec2d.hxx>
#include<TColgp_SequenceOfXY.hxx>
#include<TColgp_SequenceOfXYZ.hxx>
#include<TColStd_Array1OfAsciiString.hxx>
#include<TColStd_Array1OfBoolean.hxx>
#include<TColStd_Array1OfByte.hxx>
#include<TColStd_Array1OfCharacter.hxx>
#include<TColStd_Array1OfExtendedString.hxx>
#include<TColStd_Array1OfInteger.hxx>
#include<TColStd_Array1OfListOfInteger.hxx>
#include<TColStd_Array1OfReal.hxx>
#include<TColStd_Array1OfTransient.hxx>
#include<TColStd_Array2OfBoolean.hxx>
#include<TColStd_Array2OfCharacter.hxx>
#include<TColStd_Array2OfInteger.hxx>
#include<TColStd_Array2OfReal.hxx>
#include<TColStd_Array2OfTransient.hxx>
#include<TColStd_DataMapIteratorOfDataMapOfAsciiStringInteger.hxx>
#include<TColStd_DataMapIteratorOfDataMapOfIntegerInteger.hxx>
#include<TColStd_DataMapIteratorOfDataMapOfIntegerListOfInteger.hxx>
#include<TColStd_DataMapIteratorOfDataMapOfIntegerReal.hxx>
#include<TColStd_DataMapIteratorOfDataMapOfIntegerTransient.hxx>
#include<TColStd_DataMapIteratorOfDataMapOfStringInteger.hxx>
#include<TColStd_DataMapIteratorOfDataMapOfTransientTransient.hxx>
#include<TColStd_DataMapNodeOfDataMapOfAsciiStringInteger.hxx>
#include<TColStd_DataMapNodeOfDataMapOfIntegerInteger.hxx>
#include<TColStd_DataMapNodeOfDataMapOfIntegerListOfInteger.hxx>
#include<TColStd_DataMapNodeOfDataMapOfIntegerReal.hxx>
#include<TColStd_DataMapNodeOfDataMapOfIntegerTransient.hxx>
#include<TColStd_DataMapNodeOfDataMapOfStringInteger.hxx>
#include<TColStd_DataMapNodeOfDataMapOfTransientTransient.hxx>
#include<TColStd_DataMapOfAsciiStringInteger.hxx>
#include<TColStd_DataMapOfIntegerInteger.hxx>
#include<TColStd_DataMapOfIntegerListOfInteger.hxx>
#include<TColStd_DataMapOfIntegerReal.hxx>
#include<TColStd_DataMapOfIntegerTransient.hxx>
#include<TColStd_DataMapOfStringInteger.hxx>
#include<TColStd_DataMapOfTransientTransient.hxx>
#include<TColStd_HArray1OfAsciiString.hxx>
#include<TColStd_HArray1OfBoolean.hxx>
#include<TColStd_HArray1OfByte.hxx>
#include<TColStd_HArray1OfCharacter.hxx>
#include<TColStd_HArray1OfExtendedString.hxx>
#include<TColStd_HArray1OfInteger.hxx>
#include<TColStd_HArray1OfListOfInteger.hxx>
#include<TColStd_HArray1OfReal.hxx>
#include<TColStd_HArray1OfTransient.hxx>
#include<TColStd_HArray2OfBoolean.hxx>
#include<TColStd_HArray2OfCharacter.hxx>
#include<TColStd_HArray2OfInteger.hxx>
#include<TColStd_HArray2OfReal.hxx>
#include<TColStd_HArray2OfTransient.hxx>
#include<TColStd_HPackedMapOfInteger.hxx>
#include<TColStd_HSequenceOfAsciiString.hxx>
#include<TColStd_HSequenceOfExtendedString.hxx>
#include<TColStd_HSequenceOfHAsciiString.hxx>
#include<TColStd_HSequenceOfHExtendedString.hxx>
#include<TColStd_HSequenceOfInteger.hxx>
#include<TColStd_HSequenceOfReal.hxx>
#include<TColStd_HSequenceOfTransient.hxx>
#include<TColStd_IndexedDataMapNodeOfIndexedDataMapOfTransientTransient.hxx>
#include<TColStd_IndexedDataMapOfTransientTransient.hxx>
#include<TColStd_IndexedMapNodeOfIndexedMapOfInteger.hxx>
#include<TColStd_IndexedMapNodeOfIndexedMapOfReal.hxx>
#include<TColStd_IndexedMapNodeOfIndexedMapOfTransient.hxx>
#include<TColStd_IndexedMapOfInteger.hxx>
#include<TColStd_IndexedMapOfReal.hxx>
#include<TColStd_IndexedMapOfTransient.hxx>
#include<TColStd_ListIteratorOfListOfAsciiString.hxx>
#include<TColStd_ListIteratorOfListOfInteger.hxx>
#include<TColStd_ListIteratorOfListOfReal.hxx>
#include<TColStd_ListIteratorOfListOfTransient.hxx>
#include<TColStd_ListNodeOfListOfAsciiString.hxx>
#include<TColStd_ListNodeOfListOfInteger.hxx>
#include<TColStd_ListNodeOfListOfReal.hxx>
#include<TColStd_ListNodeOfListOfTransient.hxx>
#include<TColStd_ListOfAsciiString.hxx>
#include<TColStd_ListOfInteger.hxx>
#include<TColStd_ListOfReal.hxx>
#include<TColStd_ListOfTransient.hxx>
#include<TColStd_MapIntegerHasher.hxx>
#include<TColStd_MapIteratorOfMapOfAsciiString.hxx>
#include<TColStd_MapIteratorOfMapOfInteger.hxx>
#include<TColStd_MapIteratorOfMapOfReal.hxx>
#include<TColStd_MapIteratorOfMapOfTransient.hxx>
#include<TColStd_MapIteratorOfPackedMapOfInteger.hxx>
#include<TColStd_MapOfAsciiString.hxx>
#include<TColStd_MapOfInteger.hxx>
#include<TColStd_MapOfReal.hxx>
#include<TColStd_MapOfTransient.hxx>
#include<TColStd_MapRealHasher.hxx>
#include<TColStd_MapTransientHasher.hxx>
#include<TColStd_PackedMapOfInteger.hxx>
#include<TColStd_SequenceNodeOfSequenceOfAddress.hxx>
#include<TColStd_SequenceNodeOfSequenceOfAsciiString.hxx>
#include<TColStd_SequenceNodeOfSequenceOfBoolean.hxx>
#include<TColStd_SequenceNodeOfSequenceOfExtendedString.hxx>
#include<TColStd_SequenceNodeOfSequenceOfHAsciiString.hxx>
#include<TColStd_SequenceNodeOfSequenceOfHExtendedString.hxx>
#include<TColStd_SequenceNodeOfSequenceOfInteger.hxx>
#include<TColStd_SequenceNodeOfSequenceOfReal.hxx>
#include<TColStd_SequenceNodeOfSequenceOfTransient.hxx>
#include<TColStd_SequenceOfAddress.hxx>
#include<TColStd_SequenceOfAsciiString.hxx>
#include<TColStd_SequenceOfBoolean.hxx>
#include<TColStd_SequenceOfExtendedString.hxx>
#include<TColStd_SequenceOfHAsciiString.hxx>
#include<TColStd_SequenceOfHExtendedString.hxx>
#include<TColStd_SequenceOfInteger.hxx>
#include<TColStd_SequenceOfReal.hxx>
#include<TColStd_SequenceOfTransient.hxx>
#include<TColStd_StdMapNodeOfMapOfAsciiString.hxx>
#include<TColStd_StdMapNodeOfMapOfInteger.hxx>
#include<TColStd_StdMapNodeOfMapOfReal.hxx>
#include<TColStd_StdMapNodeOfMapOfTransient.hxx>
#include<TCollection.hxx>
#include<TCollection_AsciiString.hxx>
#include<TCollection_BaseSequence.hxx>
#include<TCollection_BasicMap.hxx>
#include<TCollection_BasicMapIterator.hxx>
#include<TCollection_CompareOfInteger.hxx>
#include<TCollection_CompareOfReal.hxx>
#include<TCollection_ExtendedString.hxx>
#include<TCollection_HAsciiString.hxx>
#include<TCollection_HExtendedString.hxx>
#include<TCollection_MapNode.hxx>
#include<TCollection_MapNodePtr.hxx>
#include<TCollection_PrivCompareOfInteger.hxx>
#include<TCollection_PrivCompareOfReal.hxx>
#include<TCollection_SeqNode.hxx>
#include<TCollection_SeqNodePtr.hxx>
#include<TCollection_Side.hxx>
#include<Storage.hxx>
#include<Storage_ArrayOfCallBack.hxx>
#include<Storage_ArrayOfSchema.hxx>
#include<Storage_BaseDriver.hxx>
#include<Storage_BucketOfPersistent.hxx>
#include<Storage_CallBack.hxx>
#include<Storage_Container.hxx>
#include<Storage_Data.hxx>
#include<Storage_DataMapIteratorOfMapOfCallBack.hxx>
#include<Storage_DataMapIteratorOfMapOfPers.hxx>
#include<Storage_DataMapNodeOfMapOfCallBack.hxx>
#include<Storage_DataMapNodeOfMapOfPers.hxx>
#include<Storage_DefaultCallBack.hxx>
#include<Storage_Error.hxx>
#include<Storage_HArrayOfCallBack.hxx>
#include<Storage_HArrayOfSchema.hxx>
#include<Storage_HeaderData.hxx>
#include<Storage_HPArray.hxx>
#include<Storage_HSeqOfRoot.hxx>
#include<Storage_IndexedDataMapNodeOfPType.hxx>
#include<Storage_InternalData.hxx>
#include<Storage_Macros.hxx>
#include<Storage_MapOfCallBack.hxx>
#include<Storage_MapOfPers.hxx>
#include<Storage_OpenMode.hxx>
#include<Storage_PArray.hxx>
#include<Storage_Position.hxx>
#include<Storage_PType.hxx>
#include<Storage_Root.hxx>
#include<Storage_RootData.hxx>
#include<Storage_Schema.hxx>
#include<Storage_SeqOfRoot.hxx>
#include<Storage_SequenceNodeOfSeqOfRoot.hxx>
#include<Storage_SolveMode.hxx>
#include<Storage_stCONSTclCOM.hxx>
#include<Storage_StreamExtCharParityError.hxx>
#include<Storage_StreamFormatError.hxx>
#include<Storage_StreamModeError.hxx>
#include<Storage_StreamReadError.hxx>
#include<Storage_StreamTypeMismatchError.hxx>
#include<Storage_StreamWriteError.hxx>
#include<Storage_TypeData.hxx>
#include<Storage_TypedCallBack.hxx>
%};
%import Standard.i
%import gp.i
%import Geom.i
%import Geom2d.i
%import StepGeom.i
%import TColgp.i
