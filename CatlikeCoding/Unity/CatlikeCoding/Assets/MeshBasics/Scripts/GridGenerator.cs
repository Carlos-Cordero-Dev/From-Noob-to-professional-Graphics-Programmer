using System.Collections;
using System.Collections.Generic;
using UnityEngine;


[RequireComponent(typeof(MeshFilter), typeof(MeshRenderer))]
public class GridGenerator : MonoBehaviour
{
    public int xSize, ySize;

    public Vector3[] vertices;
    private void Generate()
    {
        vertices = new Vector3[(xSize + 1) * (ySize + 1)];
    }
    private void Awake()
    {
        Generate();
    }
}
