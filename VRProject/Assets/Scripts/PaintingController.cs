using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using OVRTouchSample;
using System;
using UnityEngine.Events;

public class PaintingController: MonoBehaviour
{

  
    private void Awake()
    {
    }

    //public GameObject painting;
    //  public GameObject wallpaper;
    // Start is called before the first frame update
    void Start()
    {
        transform.position = new Vector3(8, (float)-0.09, 0);
     //   Transform paintingTransform = transform;
    }

    // Update is called once per frame
    void Update()
    {
        OVRInput.Update();
//#If A is pressed
        if (OVRInput.GetDown(OVRInput.Button.One))

        {
            Debug.Log("A button pressed");

            transform.position = new Vector3(8, (float)-31.5, 0);
        }

        if (OVRInput.GetDown(OVRInput.Button.Two))

        {
            Debug.Log("B button pressed");
        }


        if (OVRInput.GetDown(OVRInput.Button.Three))

        {
            Debug.Log("X button pressed");
        }


        if (OVRInput.GetDown(OVRInput.Button.PrimaryIndexTrigger))

        {
            Debug.Log(" button pressed");
        }
    }
    }
