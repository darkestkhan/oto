pragma License (Modified_GPL);
------------------------------------------------------------------------------
-- EMAIL: <darkestkhan@gmail.com>                                           --
-- License: Modified GNU GPLv3 or any later as published by Free Software   --
--  Foundation (GMGPL, see COPYING file).                                   --
--                                                                          --
--                    Copyright © 2014 darkestkhan                          --
------------------------------------------------------------------------------
--  This Program is Free Software: You can redistribute it and/or modify    --
--  it under the terms of The GNU General Public License as published by    --
--    the Free Software Foundation: either version 3 of the license, or     --
--                 (at your option) any later version.                      --
--                                                                          --
--      This Program is distributed in the hope that it will be useful,     --
--      but WITHOUT ANY WARRANTY; without even the implied warranty of      --
--      MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the        --
--              GNU General Public License for more details.                --
--                                                                          --
--    You should have received a copy of the GNU General Public License     --
--   along with this program.  If not, see <http://www.gnu.org/licenses/>.  --
--                                                                          --
-- As a special exception,  if other files  instantiate  generics from this --
-- unit, or you link  this unit with other files  to produce an executable, --
-- this  unit  does not  by itself cause  the resulting  executable  to  be --
-- covered  by the  GNU  General  Public  License.  This exception does not --
-- however invalidate  any other reasons why  the executable file  might be --
-- covered by the  GNU Public License.                                      --
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
--ALC_API ALCcontext *    ALC_APIENTRY alcCreateContext( ALCdevice *device, const ALCint* attrlist );

  function Make_Context_Current (AContext: in Context) return Bool;
--ALC_API ALCboolean      ALC_APIENTRY alcMakeContextCurrent( ALCcontext *context );

  procedure Process_Context (AContext: in Context);
--ALC_API void            ALC_APIENTRY alcProcessContext( ALCcontext *context );

  procedure Suspend_Context (AContext: in Context);
--ALC_API void            ALC_APIENTRY alcSuspendContext( ALCcontext *context );

  procedure Destroy_Context (AContext: in Context);
--ALC_API void            ALC_APIENTRY alcDestroyContext( ALCcontext *context );

  function Get_Current_Context return Context;
--ALC_API ALCcontext *    ALC_APIENTRY alcGetCurrentContext( void );

  function Get_Contexts_Device (AContext: in Context) return Device;
--ALC_API ALCdevice*      ALC_APIENTRY alcGetContextsDevice( ALCcontext *context );

  -- Device Management
  function Open_Device (Device_Name: in String) return Device;
  Pragma Inline (Open_Device);

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
  Pragma Inline (Is_Extension_Present);

  function Get_Proc_Address
    ( ADevice: in Device;
      Func_Name: in String
    ) return Pointer;
  Pragma Inline (Get_Proc_Address);

  function Get_Enum_Value
    ( ADevice: in Device;
      Enum_Name: in String
    ) return Enum;
  Pragma Inline (Get_Enum_Value);

  -- Query functions
  function Get_String (ADevice: in Device; Param: in Enum) return String;
  Pragma Inline (Get_String);

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
  Pragma Inline (Capture_Open_Device);

  function Capture_Close_Device (ADevice: in Device) return Bool;

  procedure Capture_Start (ADevice: in Device);

  procedure Capture_Stop (ADevice: in Device);

  procedure Capture_Samples
    ( ADevice: in Device;
      Buffer: in Pointer;
      Samples: in SizeI
    );

  ---------------------------------------------------------------------------

private

  ---------------------------------------------------------------------------

                            -------------------
                            -- I M P O R T S --
                            -------------------

  ---------------------------------------------------------------------------

  Pragma Import (StdCall, Create_Context, "alcCreateContext");
  Pragma Import (StdCall, Make_Context_Current, "alcMakeContextCurrent");
  Pragma Import (StdCall, Process_Context, "alcProcessContext");
  Pragma Import (StdCall, Suspend_Context, "alcSuspendContext");
  Pragma Import (StdCall, Destroy_Context, "alcDestroyContext");
  Pragma Import (StdCall, Get_Current_Context, "alcGetCurrentContext");
  Pragma Import (StdCall, Get_Contexts_Device, "alcGetContextsDevice");
  Pragma Import (StdCall, Close_Device, "alcCloseDevice");
  Pragma Import (StdCall, Get_Error, "alcGetError");
  Pragma Import (StdCall, Get_Integer, "alcGetIntegerv");
  Pragma Import (StdCall, Capture_Close_Device, "alcCaptureCloseDevice");
  Pragma Import (StdCall, Capture_Start, "alcCaptureStart");
  Pragma Import (StdCall, Capture_Stop, "alcCaptureStop");
  Pragma Import (StdCall, Capture_Samples, "alcCaptureSamples");

  ---------------------------------------------------------------------------

end Oto.ALC;
