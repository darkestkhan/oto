------------------------------------------------------------------------------
-- EMAIL: <darkestkhan@gmail.com>                                           --
-- License: ISC                                                             --
--                                                                          --
--                    Copyright © 2014 - 2015 darkestkhan                   --
------------------------------------------------------------------------------
-- Permission to use, copy, modify, and/or distribute this software for any --
-- purpose with or without fee is hereby granted, provided that the above   --
-- copyright notice and this permission notice appear in all copies.        --
--                                                                          --
-- The software is provided "as is" and the author disclaims all warranties --
-- with regard to this software including all implied warranties of         --
-- merchantability and fitness. In no event shall the author be liable for  --
-- any special, direct, indirect, or consequential damages or any damages   --
-- whatsoever resulting from loss of use, data or profits, whether in an    --
-- action of contract, negligence or other tortious action, arising out of  --
-- or in connection with the use or performance of this software.           --
------------------------------------------------------------------------------
with System;

with Oto.Binary;
use Oto;
package Oto.ALC is

  ---------------------------------------------------------------------------

                              ---------------
                              -- T Y P E S --
                              ---------------

  ---------------------------------------------------------------------------
  -- Due to the fact that only pointers to device and context are passed
  -- we ar going to use System.Address for them.
  subtype Context is System.Address;
  subtype Device  is System.Address;

  subtype Bool    is Binary.Byte;
  subtype Char    is Binary.S_Byte;
  subtype Double  is Long_Float;
  subtype Enum    is Binary.S_Word;
  subtype Int     is Integer;
  subtype Pointer is System.Address;
  subtype Short   is Binary.S_Short;
  subtype SizeI   is Integer;
  subtype UByte   is Binary.Byte;
  subtype UInt    is Binary.Word;
  subtype UShort  is Binary.Short;

  ---------------------------------------------------------------------------

                          -----------------------
                          -- C O N S T A N T S --
                          -----------------------

  ---------------------------------------------------------------------------
  -- Bool constants.
  ALC_FALSE                                : constant Bool := 0;
  ALC_TRUE                                 : constant Bool := 1;

  -- Followed by <Int> Hz
  ALC_FREQUENCY                            : constant Enum := 16#1007#;

  -- Followed by <Int> Hz
  ALC_REFRESH                              : constant Enum := 16#1008#;

  -- Followed by AL_TRUE, AL_FALSE
  ALC_SYNC                                 : constant Enum := 16#1009#;

  -- Followed by <Int> Num of requested Mono (3D) Sources
  ALC_MONO_SOURCES                         : constant Enum := 16#1010#;

  -- Followed by <Int> Num of requested Stereo Sources
  ALC_STEREO_SOURCES                       : constant Enum := 16#1011#;

  -- Errors
  -- No error
  ALC_NO_ERROR                             : constant Enum := 0;

  -- No device
  ALC_INVALID_DEVICE                       : constant Enum := 16#A001#;

  -- Invalid context ID
  ALC_INVALID_CONTEXT                      : constant Enum := 16#A002#;

  -- Bad enum
  ALC_INVALID_ENUM                         : constant Enum := 16#A003#;

  -- Bad value
  ALC_INVALID_VALUE                        : constant Enum := 16#A004#;

  -- Out of memory.
  ALC_OUT_OF_MEMORY                        : constant Enum := 16#A005#;

  -- The Specifier string for default device
  ALC_DEFAULT_DEVICE_SPECIFIER             : constant Enum := 16#1004#;
  ALC_DEVICE_SPECIFIER                     : constant Enum := 16#1005#;
  ALC_EXTENSIONS                           : constant Enum := 16#1006#;

  ALC_MAJOR_VERSION                        : constant Enum := 16#1000#;
  ALC_MINOR_VERSION                        : constant Enum := 16#1001#;

  ALC_ATTRIBUTES_SIZE                      : constant Enum := 16#1002#;
  ALC_ALL_ATTRIBUTES                       : constant Enum := 16#1003#;

  -- Capture extension
  ALC_EXT_CAPTURE                          : constant Enum := 1;
  ALC_CAPTURE_DEVICE_SPECIFIER             : constant Enum := 16#310#;
  ALC_CAPTURE_DEFAULT_DEVICE_SPECIFIER     : constant Enum := 16#311#;
  ALC_CAPTURE_SAMPLES                      : constant Enum := 16#312#;

  -- ALC_ENUMERATE_ALL_EXT enums
  ALC_ENUMERATE_ALL_EXT                    : constant Enum := 1;
  ALC_DEFAULT_ALL_DEVICES_SPECIFIER        : constant Enum := 16#1012#;
  ALC_ALL_DEVICES_SPECIFIER                : constant Enum := 16#1013#;

  ---------------------------------------------------------------------------

                    ---------------------------
                    -- S U B P R O G R A M S --
                    ---------------------------

  ---------------------------------------------------------------------------
  -- Context Management
  function Create_Context
    ( ADevice: in Device;
      Attr_List: in Pointer
    ) return Context;

  function Make_Context_Current (AContext: in Context) return Bool;

  procedure Process_Context (AContext: in Context);

  procedure Suspend_Context (AContext: in Context);

  procedure Destroy_Context (AContext: in Context);

  function Get_Current_Context return Context;

  function Get_Contexts_Device (AContext: in Context) return Device;

  -- Device Management
  function Open_Device (Device_Name: in String) return Device;
  pragma Inline (Open_Device);

  function Close_Device (ADevice: in Device) return Bool;

  -- Error support.
  -- Obtain the most recent Context error
  function Get_Error (ADevice: in Device) return Enum;

  -- Extension support.
  -- Query for the presence of an extension, and obtain any appropriate
  -- function pointers and enum values.
  function Is_Extension_Present
    ( ADevice: in Device;
      Ext_Name: in String
    ) return Bool;
  pragma Inline (Is_Extension_Present);

  function Get_Proc_Address
    ( ADevice: in Device;
      Func_Name: in String
    ) return Pointer;
  pragma Inline (Get_Proc_Address);

  function Get_Enum_Value
    ( ADevice: in Device;
      Enum_Name: in String
    ) return Enum;
  pragma Inline (Get_Enum_Value);

  -- Query functions
  function Get_String (ADevice: in Device; Param: in Enum) return String;
  pragma Inline (Get_String);

  procedure Get_Integer
    ( ADevice: in Device;
      Param: in Enum;
      Size: in SizeI;
      Data: in Pointer
    );

  -- Capture functions
  function Capture_Open_Device
    ( Device_Name: in String;
      Frequency: in UInt;
      Format: in Enum;
      Buffer_Size: in SizeI
    ) return Device;
  pragma Inline (Capture_Open_Device);

  function Capture_Close_Device (ADevice: in Device) return Bool;

  procedure Capture_Start (ADevice: in Device);

  procedure Capture_Stop (ADevice: in Device);

  procedure Capture_Samples
    ( ADevice: in Device;
      Buffer: in Pointer;
      Samples: in SizeI
    );

  ---------------------------------------------------------------------------

  -- NOTE: Pointer-To-Function types are not bound.

  ---------------------------------------------------------------------------

private

  ---------------------------------------------------------------------------

                            -------------------
                            -- I M P O R T S --
                            -------------------

  ---------------------------------------------------------------------------

  pragma Import (StdCall, Create_Context, "alcCreateContext");
  pragma Import (StdCall, Make_Context_Current, "alcMakeContextCurrent");
  pragma Import (StdCall, Process_Context, "alcProcessContext");
  pragma Import (StdCall, Suspend_Context, "alcSuspendContext");
  pragma Import (StdCall, Destroy_Context, "alcDestroyContext");
  pragma Import (StdCall, Get_Current_Context, "alcGetCurrentContext");
  pragma Import (StdCall, Get_Contexts_Device, "alcGetContextsDevice");
  pragma Import (StdCall, Close_Device, "alcCloseDevice");
  pragma Import (StdCall, Get_Error, "alcGetError");
  pragma Import (StdCall, Get_Integer, "alcGetIntegerv");
  pragma Import (StdCall, Capture_Close_Device, "alcCaptureCloseDevice");
  pragma Import (StdCall, Capture_Start, "alcCaptureStart");
  pragma Import (StdCall, Capture_Stop, "alcCaptureStop");
  pragma Import (StdCall, Capture_Samples, "alcCaptureSamples");

  ---------------------------------------------------------------------------

end Oto.ALC;
