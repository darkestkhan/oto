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

with Interfaces.C;
with Interfaces.C.Strings;
package body Oto.AL is

  ---------------------------------------------------------------------------

                              -------------------
                              -- R E N A M E S --
                              -------------------

  ---------------------------------------------------------------------------

  package IC renames Interfaces.C;
  package CStrings renames Interfaces.C.Strings;

  ---------------------------------------------------------------------------

                      ---------------------------------
                      -- I N S T A N T I A T I O N S --
                      ---------------------------------

  ---------------------------------------------------------------------------

  procedure Free is new
    Ada.Unchecked_Deallocation (IC.char_array, CStrings.char_array_access);

  ---------------------------------------------------------------------------

                -------------------------------------------
                -- S U B P R O G R A M S '   B O D I E S --
                -------------------------------------------

  ---------------------------------------------------------------------------

  function Get_String (Param: in Enum) return String
  is
    function alGetString (Param: in Enum) return CStrings.chars_ptr;
    pragma Import (StdCall, alGetString, "alGetString");
  begin
    return IC.To_Ada (CStrings.Value (alGetString (Param)));
  end Get_String;

  ---------------------------------------------------------------------------

  procedure Get_Boolean (Param: in Enum; Data: in Pointer)
  is
    procedure alGetBooleanV (Param: in Enum; Data: in Pointer);
    pragma Import (StdCall, alGetBooleanV, "alGetBooleanv");
  begin
    alGetBooleanV (Param, Data);
  end Get_Boolean;

  ---------------------------------------------------------------------------

  function Get_Boolean (Param: in Enum) return Bool
  is
    function alGetBoolean (Param: in Enum) return Bool;
    pragma Import (StdCall, alGetBoolean, "alGetBoolean");
  begin
    return alGetBoolean (Param);
  end Get_Boolean;

  ---------------------------------------------------------------------------

  procedure Get_Integer (Param: in Enum; Data: in Pointer)
  is
    procedure alGetIntegerV (Param: in Enum; Data: in Pointer);
    pragma Import (StdCall, alGetIntegerV, "alGetIntegerv");
  begin
    alGetIntegerV (Param, Data);
  end Get_Integer;

  ---------------------------------------------------------------------------

  function Get_Integer (Param: in Enum) return Int
  is
    function alGetInteger (Param: in Enum) return Int;
    pragma Import (StdCall, alGetInteger, "alGetInteger");
  begin
    return alGetInteger (Param);
  end Get_Integer;

  ---------------------------------------------------------------------------

  procedure Get_Float (Param: in Enum; Data: in Pointer)
  is
    procedure alGetFloatV (Param: in Enum; Data: in Pointer);
    pragma Import (StdCall, alGetFloatV, "alGetFloatv");
  begin
    alGetFloatV (Param, Data);
  end Get_Float;

  ---------------------------------------------------------------------------

  function Get_Float (Param: in Enum) return Float
  is
    function alGetFloat (Param: in Enum) return Float;
    pragma Import (StdCall, alGetFloat, "alGetFloat");
  begin
    return alGetFloat (Param);
  end Get_Float;

  ---------------------------------------------------------------------------

  procedure Get_Double (Param: in Enum; Data: in Pointer)
  is
    procedure alGetDoubleV (Param: in Enum; Data: in Pointer);
    pragma Import (StdCall, alGetDoubleV, "alGetDoublev");
  begin
    alGetDoubleV (Param, Data);
  end Get_Double;

  ---------------------------------------------------------------------------

  function Get_Double (Param: in Enum) return Double
  is
    function alGetDouble (Param: in Enum) return Double;
    pragma Import (StdCall, alGetDouble, "alGetDouble");
  begin
    return alGetDouble (Param);
  end Get_Double;

  ---------------------------------------------------------------------------

  function Is_Extension_Present (Ext_Name: in String) return Bool
  is
    function alIsExtensionPresent (extname: in CStrings.chars_ptr) return Bool;
    pragma Import (StdCall, alIsExtensionPresent, "alIsExtensionPresent");

    CString: CStrings.char_array_access :=
      new IC.char_array'(IC.To_C (Ext_Name));

    Success: Bool;
  begin
    Success := alIsExtensionPresent (CStrings.To_Chars_Ptr (CString));
    Free (CString);
    return Success;
  end Is_Extension_Present;

  ---------------------------------------------------------------------------

  function Get_Proc_Address (FName: in String) return Pointer
  is
    function alGetProcAddress (fname: in CStrings.chars_ptr) return Pointer;
    pragma Import (StdCall, alGetProcAddress, "alGetProcAddress");

    CString: CStrings.char_array_access :=
      new IC.char_array'(IC.To_C (FName));

    Address: Pointer;
  begin
    Address := alGetProcAddress (CStrings.To_Chars_Ptr (CString));
    Free (CString);
    return Address;
  end Get_Proc_Address;

  ---------------------------------------------------------------------------

  function Get_Enum_Value (EName: in String) return Enum
  is
    function alGetEnumValue (EName: in CStrings.chars_ptr) return Enum;
    pragma Import (StdCall, alGetEnumValue, "alGetEnumValue");

    CString: CStrings.char_array_access :=
      new IC.char_array'(IC.To_C (EName));

    Value: Enum;
  begin
    Value := alGetEnumValue (CStrings.To_Chars_Ptr (CString));
    Free (CString);
    return Value;
  end Get_Enum_Value;

  ---------------------------------------------------------------------------

  procedure Listener (Param: in Enum; Value: in Float)
  is
    procedure alListenerF (Param: in Enum; Value: in Float);
    pragma Import (StdCall, alListenerF, "alListenerf");
  begin
    alListenerF (Param, Value);
  end Listener;

  ---------------------------------------------------------------------------

  procedure Listener
    ( Param: in Enum;
      Value1: in Float;
      Value2: in Float;
      Value3: in Float
    )
  is
    procedure alListener3F
      ( Param: in Enum;
        Value1: in Float;
        Value2: in Float;
        Value3: in Float
      );
    pragma Import (StdCall, alListener3F, "alListener3f");
  begin
    alListener3F (Param, Value1, Value2, Value3);
  end Listener;

  ---------------------------------------------------------------------------

  procedure Listener (Param: in Enum; Value: in Int)
  is
    procedure alListenerI (Param: in Enum; Value: in Int);
    pragma Import (StdCall, alListenerI, "alListeneri");
  begin
    alListenerI (Param, Value);
  end Listener;

  ---------------------------------------------------------------------------

  procedure Listener
    ( Param: in Enum;
      Value1: in Int;
      Value2: in Int;
      Value3: in Int
    )
  is
    procedure alListener3I
      ( Param: in Enum;
        Value1: in Int;
        Value2: in Int;
        Value3: in Int
      );
    pragma Import (StdCall, alListener3I, "alListener3i");
  begin
    alListener3I (Param, Value1, Value2, Value3);
  end Listener;

  ---------------------------------------------------------------------------

  procedure Source (SID: in UInt; Param: in Enum; Value: in Float)
  is
    procedure alSourceF (SID: in UInt; Param: in Enum; Value: in Float);
    pragma Import (StdCall, alSourceF, "alSourcef");
  begin
    alSourceF (SID, Param, Value);
  end Source;

  ---------------------------------------------------------------------------

  procedure Source
    ( SID: in UInt;
      Param: in Enum;
      Value1: in Float;
      Value2: in Float;
      Value3: in Float
    )
  is
    procedure alSource3F
      ( SID: in UInt;
        Param: in Enum;
        Value1: in Float;
        Value2: in Float;
        Value3: in Float
      );
    pragma Import (StdCall, alSource3F, "alSource3f");
  begin
    alSource3F (SID, Param, Value1, Value2, Value3);
  end Source;

  ---------------------------------------------------------------------------

  procedure Source (SID: in UInt; Param: in Enum; Value: in Int)
  is
    procedure alSourceI (SID: in UInt; Param: in Enum; Value: in Int);
    pragma Import (StdCall, alSourceI, "alSourcei");
  begin
    alSourceI (SID, Param, Value);
  end Source;

  ---------------------------------------------------------------------------

  procedure Source
    ( SID: in UInt;
      Param: in Enum;
      Value1: in Int;
      Value2: in Int;
      Value3: in Int
    )
  is
    procedure alSource3I
      ( SID: in UInt;
        Param: in Enum;
        Value1: in Int;
        Value2: in Int;
        Value3: in Int
      );
    pragma Import (StdCall, alSource3I, "alSource3i");
  begin
    alSource3I (SID, Param, Value1, Value2, Value3);
  end Source;

  ---------------------------------------------------------------------------

  procedure Buffer (BID: in UInt; Param: in Enum; Value: in Float)
  is
    procedure alBufferF (BID: in UInt; Param: in Enum; Value: in Float);
    pragma Import (StdCall, alBufferF, "alBufferf");
  begin
    alBufferF (BID, Param, Value);
  end Buffer;

  ---------------------------------------------------------------------------

  procedure Buffer
    ( BID: in UInt;
      Param: in Enum;
      Value1: in Float;
      Value2: in Float;
      Value3: in Float
    )
  is
    procedure alBuffer3F
      ( BID: in UInt;
        Param: in Enum;
        Value1: in Float;
        Value2: in Float;
        Value3: in Float
      );
    pragma Import (StdCall, alBuffer3F, "alBuffer3f");
  begin
    alBuffer3F (BID, Param, Value1, Value2, Value3);
  end Buffer;

  ---------------------------------------------------------------------------

  procedure Buffer (BID: in UInt; Param: in Enum; Value: in Int)
  is
    procedure alBufferI (BID: in UInt; Param: in Enum; Value: in Int);
    pragma Import (StdCall, alBufferI, "alBufferi");
  begin
    alBufferI (BID, Param, Value);
  end Buffer;

  ---------------------------------------------------------------------------

  procedure Buffer
    ( BID: in UInt;
      Param: in Enum;
      Value1: in Int;
      Value2: in Int;
      Value3: in Int
    )
  is
    procedure alBuffer3I
      ( BID: in UInt;
        Param: in Enum;
        Value1: in Int;
        Value2: in Int;
        Value3: in Int
      );
    pragma Import (StdCall, alBuffer3I, "alBuffer3i");
  begin
    alBuffer3I (BID, Param, Value1, Value2, Value3);
  end Buffer;

  ---------------------------------------------------------------------------

  procedure Source_Play (NS: in SizeI; SIDs: in Pointer)
  is
    procedure alSourcePlayv (NS: in SizeI; SIDs: in Pointer);
    pragma Import (StdCall, alSourcePlayv, "alSourcePlayv");
  begin
    alSourcePlayv (NS, SIDs);
  end Source_Play;

  ---------------------------------------------------------------------------

  procedure Source_Play (SID: in UInt)
  is
    procedure alSourcePlay (SID: in UInt);
    pragma Import (StdCall, alSourcePlay, "alSourcePlay");
  begin
    alSourcePlay (SID);
  end Source_Play;

  ---------------------------------------------------------------------------

  procedure Source_Stop (NS: in SizeI; SIDs: in Pointer)
  is
    procedure alSourceStopv (NS: in SizeI; SIDs: in Pointer);
    pragma Import (StdCall, alSourceStopv, "alSourceStopv");
  begin
    alSourceStopv (NS, SIDs);
  end Source_Stop;

  ---------------------------------------------------------------------------

  procedure Source_Stop (SID: in UInt)
  is
    procedure alSourceStop (SID: in UInt);
    pragma Import (StdCall, alSourceStop, "alSourceStop");
  begin
    alSourceStop (SID);
  end Source_Stop;

  ---------------------------------------------------------------------------

  procedure Source_Rewind (NS: in SizeI; SIDs: in Pointer)
  is
    procedure alSourceRewindv (NS: in SizeI; SIDs: in Pointer);
    pragma Import (StdCall, alSourceRewindv, "alSourceRewindv");
  begin
    alSourceRewindv (NS, SIDs);
  end Source_Rewind;

  ---------------------------------------------------------------------------

  procedure Source_Rewind (SID: in UInt)
  is
    procedure alSourceRewind (SID: in UInt);
    pragma Import (StdCall, alSourceRewind, "alSourceRewind");
  begin
    alSourceRewind (SID);
  end Source_Rewind;

  ---------------------------------------------------------------------------

  procedure Source_Pause (NS: in SizeI; SIds: in Pointer)
  is
    procedure alSourcePausev (NS: in SizeI; SIds: in Pointer);
    pragma Import (StdCall, alSourcePausev, "alSourcePausev");
  begin
    alSourcePausev (NS, SIds);
  end Source_Pause;

  ---------------------------------------------------------------------------

  procedure Source_Pause (SID: in UInt)
  is
    procedure alSourcePause (SID: in UInt);
    pragma Import (StdCall, alSourcePause, "alSourcePause");
  begin
    alSourcePause (SID);
  end Source_Pause;

  ---------------------------------------------------------------------------

end Oto.AL;
