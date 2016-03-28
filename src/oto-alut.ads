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
with Ada.Unchecked_Deallocation;

with Oto.AL;
use Oto;
package Oto.ALUT is

  ---------------------------------------------------------------------------

                              ---------------
                              -- T Y P E S --
                              ---------------

  ---------------------------------------------------------------------------

  type String_Access is access String;
  type String_Array  is array (Natural range <>) of String_Access;

  ---------------------------------------------------------------------------

                      ---------------------------------
                      -- I N S T A N T I A T I O N S --
                      ---------------------------------

  ---------------------------------------------------------------------------

  procedure Free is new Ada.Unchecked_Deallocation (String, String_Access);

  ---------------------------------------------------------------------------

                          -----------------------
                          -- C O N S T A N T S --
                          -----------------------

  ---------------------------------------------------------------------------

  Null_String_Array       : constant String_Array (1 .. 0) := (others => null);

  ALUT_API_MAJOR_VERSION                 : constant AL.Enum := 1;
  ALUT_API_MINOR_VERSION                 : constant AL.Enum := 1;

  ALUT_ERROR_NO_ERROR                    : constant AL.Enum := 0;
  ALUT_ERROR_OUT_OF_MEMORY               : constant AL.Enum := 16#200#;
  ALUT_ERROR_INVALID_ENUM                : constant AL.Enum := 16#201#;
  ALUT_ERROR_INVALID_VALUE               : constant AL.Enum := 16#202#;
  ALUT_ERROR_INVALID_OPERATION           : constant AL.Enum := 16#203#;
  ALUT_ERROR_NO_CURRENT_CONTEXT          : constant AL.Enum := 16#204#;
  ALUT_ERROR_AL_ERROR_ON_ENTRY           : constant AL.Enum := 16#205#;
  ALUT_ERROR_ALC_ERROR_ON_ENTRY          : constant AL.Enum := 16#206#;
  ALUT_ERROR_OPEN_DEVICE                 : constant AL.Enum := 16#207#;
  ALUT_ERROR_CLOSE_DEVICE                : constant AL.Enum := 16#208#;
  ALUT_ERROR_CREATE_CONTEXT              : constant AL.Enum := 16#209#;
  ALUT_ERROR_MAKE_CONTEXT_CURRENT        : constant AL.Enum := 16#20A#;
  ALUT_ERROR_DESTROY_CONTEXT             : constant AL.Enum := 16#20B#;
  ALUT_ERROR_GEN_BUFFERS                 : constant AL.Enum := 16#20C#;
  ALUT_ERROR_BUFFER_DATA                 : constant AL.Enum := 16#20D#;
  ALUT_ERROR_IO_ERROR                    : constant AL.Enum := 16#20E#;
  ALUT_ERROR_UNSUPPORTED_FILE_TYPE       : constant AL.Enum := 16#20F#;
  ALUT_ERROR_UNSUPPORTED_FILE_SUBTYPE    : constant AL.Enum := 16#210#;
  ALUT_ERROR_CORRUPT_OR_TRUNCATED_DATA   : constant AL.Enum := 16#211#;

  ALUT_WAVEFORM_SINE                     : constant AL.Enum := 16#100#;
  ALUT_WAVEFORM_SQUARE                   : constant AL.Enum := 16#101#;
  ALUT_WAVEFORM_SAWTOOTH                 : constant AL.Enum := 16#102#;
  ALUT_WAVEFORM_WHITENOISE               : constant AL.Enum := 16#103#;
  ALUT_WAVEFORM_IMPULSE                  : constant AL.Enum := 16#104#;

  ALUT_LOADER_BUFFER                     : constant AL.Enum := 16#300#;
  ALUT_LOADER_MEMORY                     : constant AL.Enum := 16#301#;

  ---------------------------------------------------------------------------

                        ---------------------------
                        -- S U B P R O G R A M S --
                        ---------------------------

  ---------------------------------------------------------------------------

  function Init (Arguments: in String_Array) return AL.Bool
    with Inline => True;

  function Init_Without_Context (Arguments: in String_Array) return AL.Bool
    with Inline => True;

  -- alutExit is bound to Quit instead of Exit due to "exit" being Ada keyword.
  function Quit return AL.Bool
    with Import => True, Convention => StdCall, External_Name => "alutExit";

  function Get_Error return AL.Enum
    with Import => True, Convention => StdCall, External_Name => "alutGetError";

  function Get_Error_String (Error: in AL.Enum) return String
    with Inline => True;

  function Create_Buffer_From_File (File_Name: in String) return AL.UInt
    with Inline => True;

  function Create_Buffer_From_File_Image
    ( Data  : in AL.Pointer;
      Length: in AL.SizeI
    ) return AL.UInt
    with Import => True, Convention => StdCall,
         External_Name => "alutCreateBufferFromFileImage";

  function Create_Buffer_Hello_World return AL.UInt
    with Import => True, Convention => StdCall,
         External_Name => "alutCreateBufferHelloWorld";

  function Create_Buffer_Waveform
    ( Waveshape : in AL.Enum;
      Frequency : in Float;
      Phase     : in Float;
      Duration  : in Float
    ) return AL.UInt
    with Import => True, Convention => StdCall,
         External_Name => "alutCreateBufferWaveform";

  function Load_Memory_From_File
    ( File_Name : in String;
      Format    : in AL.Pointer;
      Size      : in AL.Pointer;
      Frequency : in AL.Pointer
    ) return AL.Pointer
    with Inline => True;

  function Load_Memory_From_File_Image
    ( Data      : in AL.Pointer;
      Length    : in AL.SizeI;
      Format    : in AL.Pointer;
      Size      : in AL.Pointer;
      Frequency : in AL.Pointer
    ) return AL.Pointer
    with Import => True, Convention => StdCall,
         External_NAme => "alutLoadMemoryFromFileImage";

  function Load_Memory_Hello_World
    ( Format    : in AL.Pointer;
      Size      : in AL.Pointer;
      Frequency : AL.Pointer
    ) return AL.Pointer
    with Import => True, Convention => StdCall,
         External_Name => "alutLoadMemoryHelloWorld";

  function Load_Memory_Wave_Form
    ( Waveshape : in AL.Enum;
      Frequency : in Float;
      Phase     : in Float;
      Duration  : in Float;
      Format    : in AL.Pointer;
      Size      : in AL.Pointer;
      Freq      : in AL.Pointer
    ) return AL.Pointer
    with Import => True, Convention => StdCall,
         External_Name => "alutLoadMemoryWaveform";

  function Get_MIME_Types (Loader: in AL.Enum) return String
    with Inline => True;

  function Get_Major_Version return AL.Int
    with Import => True, Convention => StdCall,
         External_Name => "alutGetMajorVersion";

  function Get_Minor_Version return AL.Int
    with Import => True, Convention => StdCall,
         External_Name => "alutGetMinorVersion";

  function Sleep (Duration: in Float) return AL.Bool
    with Import => True, Convention => StdCall,
         External_Name => "alutSleep";

  ---------------------------------------------------------------------------

end Oto.ALUT;
