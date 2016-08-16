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
%module (package="OCC") WfObjMesh

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


%include WfObjMesh_headers.i


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

%rename(wfobjmesh) WfObjMesh;
class WfObjMesh {
	public:
		%feature("compactdefaultargs") Merge;
		%feature("autodoc", "	* Sequence of meshes Make a merge of two Mesh and returns a new Mesh. Very useful if you want to merge partMesh and CheckSurfaceMesh for example

	:param mesh1:
	:type mesh1: Handle_WfObjMesh_Mesh &
	:param mesh2:
	:type mesh2: Handle_WfObjMesh_Mesh &
	:rtype: Handle_WfObjMesh_Mesh
") Merge;
		static Handle_WfObjMesh_Mesh Merge (const Handle_WfObjMesh_Mesh & mesh1,const Handle_WfObjMesh_Mesh & mesh2);
};


%nodefaultctor WfObjMesh_Mesh;
class WfObjMesh_Mesh : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") WfObjMesh_Mesh;
		%feature("autodoc", "	* Creates an empty mesh.

	:rtype: None
") WfObjMesh_Mesh;
		 WfObjMesh_Mesh ();
		%feature("compactdefaultargs") AddDomain;
		%feature("autodoc", "	* Adds a new mesh domain. The mesh deflection is defaulted to Confusion from package Precision.

	:rtype: void
") AddDomain;
		virtual void AddDomain ();
		%feature("compactdefaultargs") AddDomain;
		%feature("autodoc", "	* Adds a new mesh domain. Raised if the deflection is lower than zero Raised if the deflection is lower than Confusion from package Precision

	:param Deflection:
	:type Deflection: float
	:rtype: void
") AddDomain;
		virtual void AddDomain (const Standard_Real Deflection);
		%feature("compactdefaultargs") AddTriangle;
		%feature("autodoc", "	* Build a triangle with the triplet of vertices (V1, V2, V3). This triplet defines the indexes of the vertex in the current domain The coordinates Xn, Yn, Zn defines the normal direction to the triangle. Returns the range of the triangle in the current domain.

	:param V1:
	:type V1: int
	:param V2:
	:type V2: int
	:param V3:
	:type V3: int
	:param Xn:
	:type Xn: float
	:param Yn:
	:type Yn: float
	:param Zn:
	:type Zn: float
	:rtype: int
") AddTriangle;
		virtual Standard_Integer AddTriangle (const Standard_Integer V1,const Standard_Integer V2,const Standard_Integer V3,const Standard_Real Xn,const Standard_Real Yn,const Standard_Real Zn);
		%feature("compactdefaultargs") AddPolygon;
		%feature("autodoc", "	:param VertexCount:
	:type VertexCount: int
	:param VertexList:
	:type VertexList: int *
	:param Xn:
	:type Xn: float
	:param Yn:
	:type Yn: float
	:param Zn:
	:type Zn: float
	:rtype: int
") AddPolygon;
		virtual Standard_Integer AddPolygon (const Standard_Integer VertexCount,const Standard_Integer * VertexList,const Standard_Real Xn,const Standard_Real Yn,const Standard_Real Zn);
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "	* Returns the range of the vertex in the current domain.

	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param Z:
	:type Z: float
	:rtype: int
") AddVertex;
		virtual Standard_Integer AddVertex (const Standard_Real X,const Standard_Real Y,const Standard_Real Z);
		%feature("compactdefaultargs") AddOnlyNewVertex;
		%feature("autodoc", "	* Returns the range of the vertex in the current domain. The current vertex is not inserted in the mesh if it already exist.

	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param Z:
	:type Z: float
	:rtype: int
") AddOnlyNewVertex;
		virtual Standard_Integer AddOnlyNewVertex (const Standard_Real X,const Standard_Real Y,const Standard_Real Z);
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "	* Each vertex of the mesh verifies the following relations : XYZMin.X() <= X <= XYZMax.X() XYZMin.Y() <= Y <= XYZMax.y() XYZMin.Z() <= Z <= XYZMax.Z()

	:param XYZmax:
	:type XYZmax: gp_XYZ
	:param XYZmin:
	:type XYZmin: gp_XYZ
	:rtype: void
") Bounds;
		virtual void Bounds (gp_XYZ & XYZmax,gp_XYZ & XYZmin);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: void
") Clear;
		virtual void Clear ();
		%feature("compactdefaultargs") Deflection;
		%feature("autodoc", "	* Returns the deflection of the mesh of the domain of range <DomainIndex>. Raised if <DomainIndex> is lower than 1 or greater than the number of domains.

	:param DomainIndex:
	:type DomainIndex: int
	:rtype: float
") Deflection;
		virtual Standard_Real Deflection (const Standard_Integer DomainIndex);
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") NbDomains;
		%feature("autodoc", "	* Number of domains in the mesh.

	:rtype: int
") NbDomains;
		Standard_Integer NbDomains ();
		%feature("compactdefaultargs") NbTriangles;
		%feature("autodoc", "	* Cumulative Number of triangles in the mesh.

	:rtype: int
") NbTriangles;
		Standard_Integer NbTriangles ();
		%feature("compactdefaultargs") NbTriangles;
		%feature("autodoc", "	* Number of triangles in the domain of range <DomainIndex>. Raised if <DomainIndex> is lower than 1 or greater than the number of domains.

	:param DomainIndex:
	:type DomainIndex: int
	:rtype: int
") NbTriangles;
		virtual Standard_Integer NbTriangles (const Standard_Integer DomainIndex);
		%feature("compactdefaultargs") NbPolygons;
		%feature("autodoc", "	* Cumulative Number of polygons in the mesh.

	:rtype: int
") NbPolygons;
		Standard_Integer NbPolygons ();
		%feature("compactdefaultargs") NbPolygons;
		%feature("autodoc", "	* Number of polygons in the domain of range <DomainIndex>. Raised if <DomainIndex> is lower than 1 or greater than the number of domains.

	:param DomainIndex:
	:type DomainIndex: int
	:rtype: int
") NbPolygons;
		virtual Standard_Integer NbPolygons (const Standard_Integer DomainIndex);
		%feature("compactdefaultargs") NbVertices;
		%feature("autodoc", "	* Cumulative Number of vertices in the mesh.

	:rtype: int
") NbVertices;
		Standard_Integer NbVertices ();
		%feature("compactdefaultargs") NbVertices;
		%feature("autodoc", "	* Number of vertices in the domain of range <DomainIndex>. Raised if <DomainIndex> is lower than 1 or greater than the number of domains.

	:param DomainIndex:
	:type DomainIndex: int
	:rtype: int
") NbVertices;
		virtual Standard_Integer NbVertices (const Standard_Integer DomainIndex);
		%feature("compactdefaultargs") Triangles;
		%feature("autodoc", "	* Returns the set of triangle of the mesh domain of range <DomainIndex>. Raised if <DomainIndex> is lower than 1 or greater than the number of domains.

	:param DomainIndex: default value is 1
	:type DomainIndex: int
	:rtype: WfObjMesh_SequenceOfMeshTriangle
") Triangles;
		virtual const WfObjMesh_SequenceOfMeshTriangle & Triangles (const Standard_Integer DomainIndex = 1);
		%feature("compactdefaultargs") Polygons;
		%feature("autodoc", "	* Returns the set of triangle of the mesh domain of range <DomainIndex>. Raised if <DomainIndex> is lower than 1 or greater than the number of domains.

	:param DomainIndex: default value is 1
	:type DomainIndex: int
	:rtype: WfObjMesh_SequenceOfMeshPolygon
") Polygons;
		virtual const WfObjMesh_SequenceOfMeshPolygon & Polygons (const Standard_Integer DomainIndex = 1);
		%feature("compactdefaultargs") Vertices;
		%feature("autodoc", "	* Returns the coordinates of the vertices of the mesh domain of range <DomainIndex>. {XV1, YV1, ZV1, XV2, YV2, ZV2, XV3,.....} Raised if <DomainIndex> is lower than 1 or greater than the number of domains.

	:param DomainIndex: default value is 1
	:type DomainIndex: int
	:rtype: TColgp_SequenceOfXYZ
") Vertices;
		virtual const TColgp_SequenceOfXYZ & Vertices (const Standard_Integer DomainIndex = 1);
};


%extend WfObjMesh_Mesh {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_WfObjMesh_Mesh(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_WfObjMesh_Mesh::Handle_WfObjMesh_Mesh %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_WfObjMesh_Mesh;
class Handle_WfObjMesh_Mesh : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_WfObjMesh_Mesh();
        Handle_WfObjMesh_Mesh(const Handle_WfObjMesh_Mesh &aHandle);
        Handle_WfObjMesh_Mesh(const WfObjMesh_Mesh *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_WfObjMesh_Mesh DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_WfObjMesh_Mesh {
    WfObjMesh_Mesh* _get_reference() {
    return (WfObjMesh_Mesh*)$self->Access();
    }
};

%extend Handle_WfObjMesh_Mesh {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%nodefaultctor WfObjMesh_MeshDomain;
class WfObjMesh_MeshDomain : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") WfObjMesh_MeshDomain;
		%feature("autodoc", "	* The mesh deflection is defaulted to Confusion from package Precision.

	:rtype: None
") WfObjMesh_MeshDomain;
		 WfObjMesh_MeshDomain ();
		%feature("compactdefaultargs") WfObjMesh_MeshDomain;
		%feature("autodoc", "	* Raised if the deflection is lower than zero Raised if the deflection is lower than Confusion from package Precision

	:param Deflection:
	:type Deflection: float
	:rtype: None
") WfObjMesh_MeshDomain;
		 WfObjMesh_MeshDomain (const Standard_Real Deflection);
		%feature("compactdefaultargs") AddTriangle;
		%feature("autodoc", "	* Build a triangle with the triplet of vertices (V1, V2, V3). This triplet defines the indexes of the vertex in the current domain The coordinates Xn, Yn, Zn defines the normal direction to the triangle. Returns the range of the triangle in the current domain.

	:param V1:
	:type V1: int
	:param V2:
	:type V2: int
	:param V3:
	:type V3: int
	:param Xn:
	:type Xn: float
	:param Yn:
	:type Yn: float
	:param Zn:
	:type Zn: float
	:rtype: int
") AddTriangle;
		virtual Standard_Integer AddTriangle (const Standard_Integer V1,const Standard_Integer V2,const Standard_Integer V3,const Standard_Real Xn,const Standard_Real Yn,const Standard_Real Zn);
		%feature("compactdefaultargs") AddPolygon;
		%feature("autodoc", "	:param VertexCount:
	:type VertexCount: int
	:param VertexList:
	:type VertexList: int *
	:param Xn:
	:type Xn: float
	:param Yn:
	:type Yn: float
	:param Zn:
	:type Zn: float
	:rtype: int
") AddPolygon;
		virtual Standard_Integer AddPolygon (const Standard_Integer VertexCount,const Standard_Integer * VertexList,const Standard_Real Xn,const Standard_Real Yn,const Standard_Real Zn);
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "	* Returns the range of the vertex in the current domain.

	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param Z:
	:type Z: float
	:rtype: int
") AddVertex;
		virtual Standard_Integer AddVertex (const Standard_Real X,const Standard_Real Y,const Standard_Real Z);
		%feature("compactdefaultargs") AddOnlyNewVertex;
		%feature("autodoc", "	* Returns the range of the vertex in the current domain. The current vertex is not inserted in the mesh if it already exist.

	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param Z:
	:type Z: float
	:param IsNew:
	:type IsNew: bool
	:rtype: int
") AddOnlyNewVertex;
		virtual Standard_Integer AddOnlyNewVertex (const Standard_Real X,const Standard_Real Y,const Standard_Real Z,Standard_Boolean &OutValue);
		%feature("compactdefaultargs") Deflection;
		%feature("autodoc", "	:rtype: float
") Deflection;
		Standard_Real Deflection ();
		%feature("compactdefaultargs") NbTriangles;
		%feature("autodoc", "	* Number of triangles in the mesh.

	:rtype: int
") NbTriangles;
		Standard_Integer NbTriangles ();
		%feature("compactdefaultargs") NbPolygons;
		%feature("autodoc", "	* Number of polygons in the mesh.

	:rtype: int
") NbPolygons;
		Standard_Integer NbPolygons ();
		%feature("compactdefaultargs") NbVertices;
		%feature("autodoc", "	* Number of vertices in the mesh.

	:rtype: int
") NbVertices;
		Standard_Integer NbVertices ();
		%feature("compactdefaultargs") Triangles;
		%feature("autodoc", "	* Returns the set of triangles of the current mesh domain

	:rtype: WfObjMesh_SequenceOfMeshTriangle
") Triangles;
		const WfObjMesh_SequenceOfMeshTriangle & Triangles ();
		%feature("compactdefaultargs") Polygons;
		%feature("autodoc", "	* Returns the set of polygons of the current mesh domain

	:rtype: WfObjMesh_SequenceOfMeshPolygon
") Polygons;
		const WfObjMesh_SequenceOfMeshPolygon & Polygons ();
		%feature("compactdefaultargs") Vertices;
		%feature("autodoc", "	* Returns the coordinates of the vertices of the mesh domain of range <DomainIndex>. {XV1, YV1, ZV1, XV2, YV2, ZV2, XV3,.....}

	:rtype: TColgp_SequenceOfXYZ
") Vertices;
		const TColgp_SequenceOfXYZ & Vertices ();
};


%extend WfObjMesh_MeshDomain {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_WfObjMesh_MeshDomain(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_WfObjMesh_MeshDomain::Handle_WfObjMesh_MeshDomain %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_WfObjMesh_MeshDomain;
class Handle_WfObjMesh_MeshDomain : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_WfObjMesh_MeshDomain();
        Handle_WfObjMesh_MeshDomain(const Handle_WfObjMesh_MeshDomain &aHandle);
        Handle_WfObjMesh_MeshDomain(const WfObjMesh_MeshDomain *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_WfObjMesh_MeshDomain DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_WfObjMesh_MeshDomain {
    WfObjMesh_MeshDomain* _get_reference() {
    return (WfObjMesh_MeshDomain*)$self->Access();
    }
};

%extend Handle_WfObjMesh_MeshDomain {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%nodefaultctor WfObjMesh_MeshExplorer;
class WfObjMesh_MeshExplorer {
	public:
		%feature("compactdefaultargs") WfObjMesh_MeshExplorer;
		%feature("autodoc", "	:param M:
	:type M: Handle_WfObjMesh_Mesh &
	:rtype: None
") WfObjMesh_MeshExplorer;
		 WfObjMesh_MeshExplorer (const Handle_WfObjMesh_Mesh & M);
		%feature("compactdefaultargs") Deflection;
		%feature("autodoc", "	* Returns the mesh deflection of the current domain.

	:rtype: float
") Deflection;
		Standard_Real Deflection ();
		%feature("compactdefaultargs") InitTriangle;
		%feature("autodoc", "	* Initializes the exploration of the triangles of the mesh domain of range <DomainIndex>. Raised if <DomainIndex> is lower than 1 or greater than the number of domains.

	:param DomainIndex: default value is 1
	:type DomainIndex: int
	:rtype: None
") InitTriangle;
		void InitTriangle (const Standard_Integer DomainIndex = 1);
		%feature("compactdefaultargs") MoreTriangle;
		%feature("autodoc", "	:rtype: bool
") MoreTriangle;
		Standard_Boolean MoreTriangle ();
		%feature("compactdefaultargs") NextTriangle;
		%feature("autodoc", "	* Raised if there is no more triangle in the current domain.

	:rtype: None
") NextTriangle;
		void NextTriangle ();
		%feature("compactdefaultargs") TriangleVertices;
		%feature("autodoc", "	* Raised if there is no more triangle in the current domain.

	:param X1:
	:type X1: float &
	:param Y1:
	:type Y1: float &
	:param Z1:
	:type Z1: float &
	:param X2:
	:type X2: float &
	:param Y2:
	:type Y2: float &
	:param Z2:
	:type Z2: float &
	:param X3:
	:type X3: float &
	:param Y3:
	:type Y3: float &
	:param Z3:
	:type Z3: float &
	:rtype: None
") TriangleVertices;
		void TriangleVertices (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") TriangleOrientation;
		%feature("autodoc", "	* Raised if there is no more triangle in the current domain.

	:param Xn:
	:type Xn: float &
	:param Yn:
	:type Yn: float &
	:param Zn:
	:type Zn: float &
	:rtype: None
") TriangleOrientation;
		void TriangleOrientation (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") InitPolygon;
		%feature("autodoc", "	:param DomainIndex: default value is 1
	:type DomainIndex: int
	:rtype: None
") InitPolygon;
		void InitPolygon (const Standard_Integer DomainIndex = 1);
		%feature("compactdefaultargs") MorePolygon;
		%feature("autodoc", "	:rtype: bool
") MorePolygon;
		Standard_Boolean MorePolygon ();
		%feature("compactdefaultargs") NextPolygon;
		%feature("autodoc", "	* Raised if there is no more triangle in the current domain.

	:rtype: None
") NextPolygon;
		void NextPolygon ();
		%feature("compactdefaultargs") PolygonVertexCount;
		%feature("autodoc", "	:rtype: int
") PolygonVertexCount;
		Standard_Integer PolygonVertexCount ();
		%feature("compactdefaultargs") PolygonVertex;
		%feature("autodoc", "	:param VI:
	:type VI: int
	:param X:
	:type X: float &
	:param Y:
	:type Y: float &
	:param Z:
	:type Z: float &
	:rtype: None
") PolygonVertex;
		void PolygonVertex (Standard_Integer VI,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") PolygonOrientation;
		%feature("autodoc", "	:param Xn:
	:type Xn: float &
	:param Yn:
	:type Yn: float &
	:param Zn:
	:type Zn: float &
	:rtype: None
") PolygonOrientation;
		void PolygonOrientation (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
};


%nodefaultctor WfObjMesh_MeshPolygon;
class WfObjMesh_MeshPolygon : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") WfObjMesh_MeshPolygon;
		%feature("autodoc", "	* empty constructor

	:rtype: None
") WfObjMesh_MeshPolygon;
		 WfObjMesh_MeshPolygon ();
		%feature("compactdefaultargs") WfObjMesh_MeshPolygon;
		%feature("autodoc", "	:param VertexCount:
	:type VertexCount: int
	:param VertexList:
	:type VertexList: int *
	:param Xn:
	:type Xn: float
	:param Yn:
	:type Yn: float
	:param Zn:
	:type Zn: float
	:rtype: None
") WfObjMesh_MeshPolygon;
		 WfObjMesh_MeshPolygon (const Standard_Integer VertexCount,const Standard_Integer * VertexList,const Standard_Real Xn,const Standard_Real Yn,const Standard_Real Zn);
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "	* Add a new vertex index Raised if Vertex count is larger than WFOBJ_POLYGON_MAX_VERTICES or V is lower than zero

	:param V:
	:type V: int
	:rtype: None
") AddVertex;
		void AddVertex (const Standard_Integer V);
		%feature("compactdefaultargs") GetVertexCount;
		%feature("autodoc", "	:rtype: int
") GetVertexCount;
		Standard_Integer GetVertexCount ();
		%feature("compactdefaultargs") GetVertex;
		%feature("autodoc", "	:param idx:
	:type idx: int
	:rtype: int
") GetVertex;
		Standard_Integer GetVertex (Standard_Integer idx);
		%feature("compactdefaultargs") SetOrientation;
		%feature("autodoc", "	:param Xn:
	:type Xn: float
	:param Yn:
	:type Yn: float
	:param Zn:
	:type Zn: float
	:rtype: None
") SetOrientation;
		void SetOrientation (const Standard_Real Xn,const Standard_Real Yn,const Standard_Real Zn);
		%feature("compactdefaultargs") GetOrientation;
		%feature("autodoc", "	:param Xn:
	:type Xn: float &
	:param Yn:
	:type Yn: float &
	:param Zn:
	:type Zn: float &
	:rtype: None
") GetOrientation;
		void GetOrientation (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
};


%extend WfObjMesh_MeshPolygon {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_WfObjMesh_MeshPolygon(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_WfObjMesh_MeshPolygon::Handle_WfObjMesh_MeshPolygon %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_WfObjMesh_MeshPolygon;
class Handle_WfObjMesh_MeshPolygon : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_WfObjMesh_MeshPolygon();
        Handle_WfObjMesh_MeshPolygon(const Handle_WfObjMesh_MeshPolygon &aHandle);
        Handle_WfObjMesh_MeshPolygon(const WfObjMesh_MeshPolygon *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_WfObjMesh_MeshPolygon DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_WfObjMesh_MeshPolygon {
    WfObjMesh_MeshPolygon* _get_reference() {
    return (WfObjMesh_MeshPolygon*)$self->Access();
    }
};

%extend Handle_WfObjMesh_MeshPolygon {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%nodefaultctor WfObjMesh_MeshTriangle;
class WfObjMesh_MeshTriangle : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") WfObjMesh_MeshTriangle;
		%feature("autodoc", "	* empty constructor

	:rtype: None
") WfObjMesh_MeshTriangle;
		 WfObjMesh_MeshTriangle ();
		%feature("compactdefaultargs") WfObjMesh_MeshTriangle;
		%feature("autodoc", "	* create a triangle defined with the indexes of its three vertices and its orientation Raised if V1, V2 or V3 is lower than zero

	:param V1:
	:type V1: int
	:param V2:
	:type V2: int
	:param V3:
	:type V3: int
	:param Xn:
	:type Xn: float
	:param Yn:
	:type Yn: float
	:param Zn:
	:type Zn: float
	:rtype: None
") WfObjMesh_MeshTriangle;
		 WfObjMesh_MeshTriangle (const Standard_Integer V1,const Standard_Integer V2,const Standard_Integer V3,const Standard_Real Xn,const Standard_Real Yn,const Standard_Real Zn);
		%feature("compactdefaultargs") GetVertexAndOrientation;
		%feature("autodoc", "	* get indexes of the three vertices (V1,V2,V3) and the orientation

	:param V1:
	:type V1: int &
	:param V2:
	:type V2: int &
	:param V3:
	:type V3: int &
	:param Xn:
	:type Xn: float &
	:param Yn:
	:type Yn: float &
	:param Zn:
	:type Zn: float &
	:rtype: None
") GetVertexAndOrientation;
		void GetVertexAndOrientation (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") SetVertexAndOrientation;
		%feature("autodoc", "	* set indexes of the three vertices (V1,V2,V3) and the orientation Raised if V1, V2 or V3 is lower than zero

	:param V1:
	:type V1: int
	:param V2:
	:type V2: int
	:param V3:
	:type V3: int
	:param Xn:
	:type Xn: float
	:param Yn:
	:type Yn: float
	:param Zn:
	:type Zn: float
	:rtype: None
") SetVertexAndOrientation;
		void SetVertexAndOrientation (const Standard_Integer V1,const Standard_Integer V2,const Standard_Integer V3,const Standard_Real Xn,const Standard_Real Yn,const Standard_Real Zn);
		%feature("compactdefaultargs") GetVertex;
		%feature("autodoc", "	* get indexes of the three vertices (V1,V2,V3)

	:param V1:
	:type V1: int &
	:param V2:
	:type V2: int &
	:param V3:
	:type V3: int &
	:rtype: None
") GetVertex;
		void GetVertex (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("compactdefaultargs") SetVertex;
		%feature("autodoc", "	* set indexes of the three vertices (V1,V2,V3) Raised if V1, V2 or V3 is lower than zero

	:param V1:
	:type V1: int
	:param V2:
	:type V2: int
	:param V3:
	:type V3: int
	:rtype: None
") SetVertex;
		void SetVertex (const Standard_Integer V1,const Standard_Integer V2,const Standard_Integer V3);
};


%extend WfObjMesh_MeshTriangle {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_WfObjMesh_MeshTriangle(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_WfObjMesh_MeshTriangle::Handle_WfObjMesh_MeshTriangle %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_WfObjMesh_MeshTriangle;
class Handle_WfObjMesh_MeshTriangle : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_WfObjMesh_MeshTriangle();
        Handle_WfObjMesh_MeshTriangle(const Handle_WfObjMesh_MeshTriangle &aHandle);
        Handle_WfObjMesh_MeshTriangle(const WfObjMesh_MeshTriangle *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_WfObjMesh_MeshTriangle DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_WfObjMesh_MeshTriangle {
    WfObjMesh_MeshTriangle* _get_reference() {
    return (WfObjMesh_MeshTriangle*)$self->Access();
    }
};

%extend Handle_WfObjMesh_MeshTriangle {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%nodefaultctor WfObjMesh_SequenceNodeOfSequenceOfMesh;
class WfObjMesh_SequenceNodeOfSequenceOfMesh : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") WfObjMesh_SequenceNodeOfSequenceOfMesh;
		%feature("autodoc", "	:param I:
	:type I: Handle_WfObjMesh_Mesh &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") WfObjMesh_SequenceNodeOfSequenceOfMesh;
		 WfObjMesh_SequenceNodeOfSequenceOfMesh (const Handle_WfObjMesh_Mesh & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_WfObjMesh_Mesh
") Value;
		Handle_WfObjMesh_Mesh Value ();
};


%extend WfObjMesh_SequenceNodeOfSequenceOfMesh {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_WfObjMesh_SequenceNodeOfSequenceOfMesh(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_WfObjMesh_SequenceNodeOfSequenceOfMesh::Handle_WfObjMesh_SequenceNodeOfSequenceOfMesh %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_WfObjMesh_SequenceNodeOfSequenceOfMesh;
class Handle_WfObjMesh_SequenceNodeOfSequenceOfMesh : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_WfObjMesh_SequenceNodeOfSequenceOfMesh();
        Handle_WfObjMesh_SequenceNodeOfSequenceOfMesh(const Handle_WfObjMesh_SequenceNodeOfSequenceOfMesh &aHandle);
        Handle_WfObjMesh_SequenceNodeOfSequenceOfMesh(const WfObjMesh_SequenceNodeOfSequenceOfMesh *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_WfObjMesh_SequenceNodeOfSequenceOfMesh DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_WfObjMesh_SequenceNodeOfSequenceOfMesh {
    WfObjMesh_SequenceNodeOfSequenceOfMesh* _get_reference() {
    return (WfObjMesh_SequenceNodeOfSequenceOfMesh*)$self->Access();
    }
};

%extend Handle_WfObjMesh_SequenceNodeOfSequenceOfMesh {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%nodefaultctor WfObjMesh_SequenceNodeOfSequenceOfMeshDomain;
class WfObjMesh_SequenceNodeOfSequenceOfMeshDomain : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") WfObjMesh_SequenceNodeOfSequenceOfMeshDomain;
		%feature("autodoc", "	:param I:
	:type I: Handle_WfObjMesh_MeshDomain &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") WfObjMesh_SequenceNodeOfSequenceOfMeshDomain;
		 WfObjMesh_SequenceNodeOfSequenceOfMeshDomain (const Handle_WfObjMesh_MeshDomain & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_WfObjMesh_MeshDomain
") Value;
		Handle_WfObjMesh_MeshDomain Value ();
};


%extend WfObjMesh_SequenceNodeOfSequenceOfMeshDomain {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_WfObjMesh_SequenceNodeOfSequenceOfMeshDomain(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_WfObjMesh_SequenceNodeOfSequenceOfMeshDomain::Handle_WfObjMesh_SequenceNodeOfSequenceOfMeshDomain %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_WfObjMesh_SequenceNodeOfSequenceOfMeshDomain;
class Handle_WfObjMesh_SequenceNodeOfSequenceOfMeshDomain : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_WfObjMesh_SequenceNodeOfSequenceOfMeshDomain();
        Handle_WfObjMesh_SequenceNodeOfSequenceOfMeshDomain(const Handle_WfObjMesh_SequenceNodeOfSequenceOfMeshDomain &aHandle);
        Handle_WfObjMesh_SequenceNodeOfSequenceOfMeshDomain(const WfObjMesh_SequenceNodeOfSequenceOfMeshDomain *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_WfObjMesh_SequenceNodeOfSequenceOfMeshDomain DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_WfObjMesh_SequenceNodeOfSequenceOfMeshDomain {
    WfObjMesh_SequenceNodeOfSequenceOfMeshDomain* _get_reference() {
    return (WfObjMesh_SequenceNodeOfSequenceOfMeshDomain*)$self->Access();
    }
};

%extend Handle_WfObjMesh_SequenceNodeOfSequenceOfMeshDomain {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%nodefaultctor WfObjMesh_SequenceNodeOfSequenceOfMeshPolygon;
class WfObjMesh_SequenceNodeOfSequenceOfMeshPolygon : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") WfObjMesh_SequenceNodeOfSequenceOfMeshPolygon;
		%feature("autodoc", "	:param I:
	:type I: Handle_WfObjMesh_MeshPolygon &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") WfObjMesh_SequenceNodeOfSequenceOfMeshPolygon;
		 WfObjMesh_SequenceNodeOfSequenceOfMeshPolygon (const Handle_WfObjMesh_MeshPolygon & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_WfObjMesh_MeshPolygon
") Value;
		Handle_WfObjMesh_MeshPolygon Value ();
};


%extend WfObjMesh_SequenceNodeOfSequenceOfMeshPolygon {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_WfObjMesh_SequenceNodeOfSequenceOfMeshPolygon(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_WfObjMesh_SequenceNodeOfSequenceOfMeshPolygon::Handle_WfObjMesh_SequenceNodeOfSequenceOfMeshPolygon %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_WfObjMesh_SequenceNodeOfSequenceOfMeshPolygon;
class Handle_WfObjMesh_SequenceNodeOfSequenceOfMeshPolygon : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_WfObjMesh_SequenceNodeOfSequenceOfMeshPolygon();
        Handle_WfObjMesh_SequenceNodeOfSequenceOfMeshPolygon(const Handle_WfObjMesh_SequenceNodeOfSequenceOfMeshPolygon &aHandle);
        Handle_WfObjMesh_SequenceNodeOfSequenceOfMeshPolygon(const WfObjMesh_SequenceNodeOfSequenceOfMeshPolygon *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_WfObjMesh_SequenceNodeOfSequenceOfMeshPolygon DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_WfObjMesh_SequenceNodeOfSequenceOfMeshPolygon {
    WfObjMesh_SequenceNodeOfSequenceOfMeshPolygon* _get_reference() {
    return (WfObjMesh_SequenceNodeOfSequenceOfMeshPolygon*)$self->Access();
    }
};

%extend Handle_WfObjMesh_SequenceNodeOfSequenceOfMeshPolygon {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%nodefaultctor WfObjMesh_SequenceNodeOfSequenceOfMeshTriangle;
class WfObjMesh_SequenceNodeOfSequenceOfMeshTriangle : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") WfObjMesh_SequenceNodeOfSequenceOfMeshTriangle;
		%feature("autodoc", "	:param I:
	:type I: Handle_WfObjMesh_MeshTriangle &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") WfObjMesh_SequenceNodeOfSequenceOfMeshTriangle;
		 WfObjMesh_SequenceNodeOfSequenceOfMeshTriangle (const Handle_WfObjMesh_MeshTriangle & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_WfObjMesh_MeshTriangle
") Value;
		Handle_WfObjMesh_MeshTriangle Value ();
};


%extend WfObjMesh_SequenceNodeOfSequenceOfMeshTriangle {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_WfObjMesh_SequenceNodeOfSequenceOfMeshTriangle(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_WfObjMesh_SequenceNodeOfSequenceOfMeshTriangle::Handle_WfObjMesh_SequenceNodeOfSequenceOfMeshTriangle %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_WfObjMesh_SequenceNodeOfSequenceOfMeshTriangle;
class Handle_WfObjMesh_SequenceNodeOfSequenceOfMeshTriangle : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_WfObjMesh_SequenceNodeOfSequenceOfMeshTriangle();
        Handle_WfObjMesh_SequenceNodeOfSequenceOfMeshTriangle(const Handle_WfObjMesh_SequenceNodeOfSequenceOfMeshTriangle &aHandle);
        Handle_WfObjMesh_SequenceNodeOfSequenceOfMeshTriangle(const WfObjMesh_SequenceNodeOfSequenceOfMeshTriangle *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_WfObjMesh_SequenceNodeOfSequenceOfMeshTriangle DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_WfObjMesh_SequenceNodeOfSequenceOfMeshTriangle {
    WfObjMesh_SequenceNodeOfSequenceOfMeshTriangle* _get_reference() {
    return (WfObjMesh_SequenceNodeOfSequenceOfMeshTriangle*)$self->Access();
    }
};

%extend Handle_WfObjMesh_SequenceNodeOfSequenceOfMeshTriangle {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%nodefaultctor WfObjMesh_SequenceOfMesh;
class WfObjMesh_SequenceOfMesh : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") WfObjMesh_SequenceOfMesh;
		%feature("autodoc", "	:rtype: None
") WfObjMesh_SequenceOfMesh;
		 WfObjMesh_SequenceOfMesh ();
		%feature("compactdefaultargs") WfObjMesh_SequenceOfMesh;
		%feature("autodoc", "	:param Other:
	:type Other: WfObjMesh_SequenceOfMesh &
	:rtype: None
") WfObjMesh_SequenceOfMesh;
		 WfObjMesh_SequenceOfMesh (const WfObjMesh_SequenceOfMesh & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: WfObjMesh_SequenceOfMesh &
	:rtype: WfObjMesh_SequenceOfMesh
") Assign;
		const WfObjMesh_SequenceOfMesh & Assign (const WfObjMesh_SequenceOfMesh & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: WfObjMesh_SequenceOfMesh &
	:rtype: WfObjMesh_SequenceOfMesh
") operator=;
		const WfObjMesh_SequenceOfMesh & operator = (const WfObjMesh_SequenceOfMesh & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Handle_WfObjMesh_Mesh &
	:rtype: None
") Append;
		void Append (const Handle_WfObjMesh_Mesh & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: WfObjMesh_SequenceOfMesh &
	:rtype: None
") Append;
		void Append (WfObjMesh_SequenceOfMesh & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Handle_WfObjMesh_Mesh &
	:rtype: None
") Prepend;
		void Prepend (const Handle_WfObjMesh_Mesh & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: WfObjMesh_SequenceOfMesh &
	:rtype: None
") Prepend;
		void Prepend (WfObjMesh_SequenceOfMesh & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_WfObjMesh_Mesh &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_WfObjMesh_Mesh & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: WfObjMesh_SequenceOfMesh &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,WfObjMesh_SequenceOfMesh & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_WfObjMesh_Mesh &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_WfObjMesh_Mesh & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: WfObjMesh_SequenceOfMesh &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,WfObjMesh_SequenceOfMesh & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_WfObjMesh_Mesh
") First;
		Handle_WfObjMesh_Mesh First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_WfObjMesh_Mesh
") Last;
		Handle_WfObjMesh_Mesh Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: WfObjMesh_SequenceOfMesh &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,WfObjMesh_SequenceOfMesh & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_WfObjMesh_Mesh
") Value;
		Handle_WfObjMesh_Mesh Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Handle_WfObjMesh_Mesh &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_WfObjMesh_Mesh & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_WfObjMesh_Mesh
") ChangeValue;
		Handle_WfObjMesh_Mesh ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%nodefaultctor WfObjMesh_SequenceOfMeshDomain;
class WfObjMesh_SequenceOfMeshDomain : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") WfObjMesh_SequenceOfMeshDomain;
		%feature("autodoc", "	:rtype: None
") WfObjMesh_SequenceOfMeshDomain;
		 WfObjMesh_SequenceOfMeshDomain ();
		%feature("compactdefaultargs") WfObjMesh_SequenceOfMeshDomain;
		%feature("autodoc", "	:param Other:
	:type Other: WfObjMesh_SequenceOfMeshDomain &
	:rtype: None
") WfObjMesh_SequenceOfMeshDomain;
		 WfObjMesh_SequenceOfMeshDomain (const WfObjMesh_SequenceOfMeshDomain & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: WfObjMesh_SequenceOfMeshDomain &
	:rtype: WfObjMesh_SequenceOfMeshDomain
") Assign;
		const WfObjMesh_SequenceOfMeshDomain & Assign (const WfObjMesh_SequenceOfMeshDomain & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: WfObjMesh_SequenceOfMeshDomain &
	:rtype: WfObjMesh_SequenceOfMeshDomain
") operator=;
		const WfObjMesh_SequenceOfMeshDomain & operator = (const WfObjMesh_SequenceOfMeshDomain & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Handle_WfObjMesh_MeshDomain &
	:rtype: None
") Append;
		void Append (const Handle_WfObjMesh_MeshDomain & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: WfObjMesh_SequenceOfMeshDomain &
	:rtype: None
") Append;
		void Append (WfObjMesh_SequenceOfMeshDomain & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Handle_WfObjMesh_MeshDomain &
	:rtype: None
") Prepend;
		void Prepend (const Handle_WfObjMesh_MeshDomain & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: WfObjMesh_SequenceOfMeshDomain &
	:rtype: None
") Prepend;
		void Prepend (WfObjMesh_SequenceOfMeshDomain & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_WfObjMesh_MeshDomain &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_WfObjMesh_MeshDomain & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: WfObjMesh_SequenceOfMeshDomain &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,WfObjMesh_SequenceOfMeshDomain & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_WfObjMesh_MeshDomain &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_WfObjMesh_MeshDomain & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: WfObjMesh_SequenceOfMeshDomain &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,WfObjMesh_SequenceOfMeshDomain & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_WfObjMesh_MeshDomain
") First;
		Handle_WfObjMesh_MeshDomain First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_WfObjMesh_MeshDomain
") Last;
		Handle_WfObjMesh_MeshDomain Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: WfObjMesh_SequenceOfMeshDomain &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,WfObjMesh_SequenceOfMeshDomain & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_WfObjMesh_MeshDomain
") Value;
		Handle_WfObjMesh_MeshDomain Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Handle_WfObjMesh_MeshDomain &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_WfObjMesh_MeshDomain & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_WfObjMesh_MeshDomain
") ChangeValue;
		Handle_WfObjMesh_MeshDomain ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%nodefaultctor WfObjMesh_SequenceOfMeshPolygon;
class WfObjMesh_SequenceOfMeshPolygon : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") WfObjMesh_SequenceOfMeshPolygon;
		%feature("autodoc", "	:rtype: None
") WfObjMesh_SequenceOfMeshPolygon;
		 WfObjMesh_SequenceOfMeshPolygon ();
		%feature("compactdefaultargs") WfObjMesh_SequenceOfMeshPolygon;
		%feature("autodoc", "	:param Other:
	:type Other: WfObjMesh_SequenceOfMeshPolygon &
	:rtype: None
") WfObjMesh_SequenceOfMeshPolygon;
		 WfObjMesh_SequenceOfMeshPolygon (const WfObjMesh_SequenceOfMeshPolygon & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: WfObjMesh_SequenceOfMeshPolygon &
	:rtype: WfObjMesh_SequenceOfMeshPolygon
") Assign;
		const WfObjMesh_SequenceOfMeshPolygon & Assign (const WfObjMesh_SequenceOfMeshPolygon & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: WfObjMesh_SequenceOfMeshPolygon &
	:rtype: WfObjMesh_SequenceOfMeshPolygon
") operator=;
		const WfObjMesh_SequenceOfMeshPolygon & operator = (const WfObjMesh_SequenceOfMeshPolygon & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Handle_WfObjMesh_MeshPolygon &
	:rtype: None
") Append;
		void Append (const Handle_WfObjMesh_MeshPolygon & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: WfObjMesh_SequenceOfMeshPolygon &
	:rtype: None
") Append;
		void Append (WfObjMesh_SequenceOfMeshPolygon & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Handle_WfObjMesh_MeshPolygon &
	:rtype: None
") Prepend;
		void Prepend (const Handle_WfObjMesh_MeshPolygon & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: WfObjMesh_SequenceOfMeshPolygon &
	:rtype: None
") Prepend;
		void Prepend (WfObjMesh_SequenceOfMeshPolygon & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_WfObjMesh_MeshPolygon &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_WfObjMesh_MeshPolygon & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: WfObjMesh_SequenceOfMeshPolygon &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,WfObjMesh_SequenceOfMeshPolygon & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_WfObjMesh_MeshPolygon &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_WfObjMesh_MeshPolygon & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: WfObjMesh_SequenceOfMeshPolygon &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,WfObjMesh_SequenceOfMeshPolygon & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_WfObjMesh_MeshPolygon
") First;
		Handle_WfObjMesh_MeshPolygon First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_WfObjMesh_MeshPolygon
") Last;
		Handle_WfObjMesh_MeshPolygon Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: WfObjMesh_SequenceOfMeshPolygon &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,WfObjMesh_SequenceOfMeshPolygon & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_WfObjMesh_MeshPolygon
") Value;
		Handle_WfObjMesh_MeshPolygon Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Handle_WfObjMesh_MeshPolygon &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_WfObjMesh_MeshPolygon & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_WfObjMesh_MeshPolygon
") ChangeValue;
		Handle_WfObjMesh_MeshPolygon ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%nodefaultctor WfObjMesh_SequenceOfMeshTriangle;
class WfObjMesh_SequenceOfMeshTriangle : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") WfObjMesh_SequenceOfMeshTriangle;
		%feature("autodoc", "	:rtype: None
") WfObjMesh_SequenceOfMeshTriangle;
		 WfObjMesh_SequenceOfMeshTriangle ();
		%feature("compactdefaultargs") WfObjMesh_SequenceOfMeshTriangle;
		%feature("autodoc", "	:param Other:
	:type Other: WfObjMesh_SequenceOfMeshTriangle &
	:rtype: None
") WfObjMesh_SequenceOfMeshTriangle;
		 WfObjMesh_SequenceOfMeshTriangle (const WfObjMesh_SequenceOfMeshTriangle & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: WfObjMesh_SequenceOfMeshTriangle &
	:rtype: WfObjMesh_SequenceOfMeshTriangle
") Assign;
		const WfObjMesh_SequenceOfMeshTriangle & Assign (const WfObjMesh_SequenceOfMeshTriangle & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: WfObjMesh_SequenceOfMeshTriangle &
	:rtype: WfObjMesh_SequenceOfMeshTriangle
") operator=;
		const WfObjMesh_SequenceOfMeshTriangle & operator = (const WfObjMesh_SequenceOfMeshTriangle & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Handle_WfObjMesh_MeshTriangle &
	:rtype: None
") Append;
		void Append (const Handle_WfObjMesh_MeshTriangle & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: WfObjMesh_SequenceOfMeshTriangle &
	:rtype: None
") Append;
		void Append (WfObjMesh_SequenceOfMeshTriangle & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Handle_WfObjMesh_MeshTriangle &
	:rtype: None
") Prepend;
		void Prepend (const Handle_WfObjMesh_MeshTriangle & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: WfObjMesh_SequenceOfMeshTriangle &
	:rtype: None
") Prepend;
		void Prepend (WfObjMesh_SequenceOfMeshTriangle & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_WfObjMesh_MeshTriangle &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_WfObjMesh_MeshTriangle & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: WfObjMesh_SequenceOfMeshTriangle &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,WfObjMesh_SequenceOfMeshTriangle & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_WfObjMesh_MeshTriangle &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_WfObjMesh_MeshTriangle & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: WfObjMesh_SequenceOfMeshTriangle &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,WfObjMesh_SequenceOfMeshTriangle & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_WfObjMesh_MeshTriangle
") First;
		Handle_WfObjMesh_MeshTriangle First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_WfObjMesh_MeshTriangle
") Last;
		Handle_WfObjMesh_MeshTriangle Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: WfObjMesh_SequenceOfMeshTriangle &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,WfObjMesh_SequenceOfMeshTriangle & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_WfObjMesh_MeshTriangle
") Value;
		Handle_WfObjMesh_MeshTriangle Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Handle_WfObjMesh_MeshTriangle &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_WfObjMesh_MeshTriangle & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_WfObjMesh_MeshTriangle
") ChangeValue;
		Handle_WfObjMesh_MeshTriangle ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


