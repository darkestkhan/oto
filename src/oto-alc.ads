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
    ) return Context
    with Import => True, Convention => StdCall,
         External_Name => "alcCreateContext";

  function Make_Context_Current (AContext: in Context) return Bool
    with Import => True, Convention => StdCall,
         External_Name => "alcMakeContextCurrent";

  procedure Process_Context (AContext: in Context)
    with Import => True, Convention => StdCall,
         External_Name => "alcProcessContext";

  procedure Suspend_Context (AContext: in Context)
    with Import => True, Convention => StdCall,
         External_Name => "alcSuspendContext";

  procedure Destroy_Context (AContext: in Context)
    with Import => True, Convention => StdCall,
         External_Name => "alcDestroyContext";

  function Get_Current_Context return Context
    with Import => True, Convention => StdCall,
         External_Name => "alcGetCurrentContext";

  function Get_Contexts_Device (AContext: in Context) return Device
    with Import => True, Convention => StdCall,
         External_Name => "alcGetContextsDevice";

  -- Device Management
  function Open_Device (Device_Name: in String) return Device
    with Inline => True;

  function Close_Device (ADevice: in Device) return Bool
    with Import => True, Convention => StdCall,
         External_Name => "alcCloseDevice";

  -- Error support.
  -- Obtain the most recent Context error
  function Get_Error (ADevice: in Device) return Enum
    with Import => True, Convention => StdCall, External_Name => "alcGetError";

  -- Extension support.
  -- Query for the presence of an extension, and obtain any appropriate
  -- function pointers and enum values.
  function Is_Extension_Present
    ( ADevice: in Device;
      Ext_Name: in String
    ) return Bool
    with Inline => True;

  function Get_Proc_Address
    ( ADevice: in Device;
      Func_Name: in String
    ) return Pointer
    with Inline => True;

  function Get_Enum_Value
    ( ADevice: in Device;
      Enum_Name: in String
    ) return Enum
    with Inline => True;

  -- Query functions
  function Get_String (ADevice: in Device; Param: in Enum) return String
    with Inline => True;

  procedure Get_Integer
    ( ADevice: in Device;
      Param: in Enum;
      Size: in SizeI;
      Data: in Pointer
    )
    with Import => True, Convention => StdCall,
         External_Name => "alcGetIntegerv";

  -- Capture functions
  function Capture_Open_Device
    ( Device_Name: in String;
      Frequency: in UInt;
      Format: in Enum;
      Buffer_Size: in SizeI
    ) return Device
    with Inline => True;

  function Capture_Close_Device (ADevice: in Device) return Bool
    with Import => True, Convention => StdCall,
         External_Name => "alcCaptureCloseDevice";

  procedure Capture_Start (ADevice: in Device)
    with Import => True, Convention => StdCall,
         External_Name => "alcCaptureStart";

  procedure Capture_Stop (ADevice: in Device)
    with Import => True, Convention => StdCall,
         External_Name => "alcCaptureStop";

  procedure Capture_Samples
    ( ADevice: in Device;
      Buffer: in Pointer;
      Samples: in SizeI
    )
    with Import => True, Convention => StdCall,
         External_Name => "alcCaptureSamples";

  ---------------------------------------------------------------------------

  -- NOTE: Pointer-To-Function types are not bound.

  ---------------------------------------------------------------------------

end Oto.ALC;
