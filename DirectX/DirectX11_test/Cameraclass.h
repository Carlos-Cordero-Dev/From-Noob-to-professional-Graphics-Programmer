
#ifndef _CAMERACLASS_H_
#define _CAMERACLASS_H_ 1

#include <directxmath.h>

using namespace DirectX;

class CameraClass
{
public:
	CameraClass();
	CameraClass(const CameraClass&);
	~CameraClass();

	void SetPosition(XMFLOAT3&);
	void SetRotation(XMFLOAT3&);

	const DirectX::XMFLOAT3* GetPosition();
	XMFLOAT3 GetRotation();

	void Render();
	void GetViewMatrix(XMMATRIX&);

private:
	XMFLOAT3 m_position;
	XMFLOAT3 m_rotation;
	XMMATRIX m_viewMatrix;
};

#endif //_CAMERACLASS_H_
