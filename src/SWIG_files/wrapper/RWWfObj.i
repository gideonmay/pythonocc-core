/*
Copyright 2008-2016 Thomas Paviot (tpaviot@gmail.com)


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
%module (package="OCC") RWWfObj

#pragma SWIG nowarn=504,325,503

%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i


%include RWWfObj_headers.i


%pythoncode {
def register_handle(handle, base_object):
    """
    Inserts the handle into the base object to
    prevent memory corruption in certain cases
    """
    try:
        if base_object.IsKind("Standard_Transient"):
            base_object.thisHandle = handle
            base_object.thisown = False
    except:
        pass
};

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%rename(rwwfobj) RWWfObj;
class RWWfObj {
	public:
		%feature("compactdefaultargs") WriteFile;
		%feature("autodoc", "	:param aMesh:
	:type aMesh: Handle_WfObjMesh_Mesh &
	:param aPath:
	:type aPath: OSD_Path &
	:param aProgInd: default value is NULL
	:type aProgInd: Handle_Message_ProgressIndicator &
	:rtype: bool
") WriteFile;
		static Standard_Boolean WriteFile (const Handle_WfObjMesh_Mesh & aMesh,const OSD_Path & aPath,const Handle_Message_ProgressIndicator & aProgInd = NULL);
		%feature("compactdefaultargs") ReadFile;
		%feature("autodoc", "	:param aPath:
	:type aPath: OSD_Path &
	:param aProgInd: default value is NULL
	:type aProgInd: Handle_Message_ProgressIndicator &
	:rtype: Handle_WfObjMesh_Mesh
") ReadFile;
		static Handle_WfObjMesh_Mesh ReadFile (const OSD_Path & aPath,const Handle_Message_ProgressIndicator & aProgInd = NULL);
};


