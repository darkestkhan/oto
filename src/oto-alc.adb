------------------------------------------------------------------------------
-- EMAIL: <darkestkhan@gmail.com>                                           --
-- License: ISC                                                             --
--                                                                          --
--                    Copyright © 2014 - 2016 darkestkhan                   --
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
package body Oto.ALC is

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

  function Open_Device (Device_Name: in String) return Device
  is
    function alcOpenDevice (Device_Name: in CStrings.chars_ptr) return Device
      with Import => True, Convention => StdCall,
           External_Name => "alcOpenDevice";

    CString: CStrings.char_array_access :=
      new IC.char_array'(IC.To_C (Device_Name));

    ADevice: Device;
  begin
    ADevice := alcOpenDevice (CStrings.To_Chars_Ptr (CString));
    Free (CString);
    return ADevice;
  end Open_Device;

  ---------------------------------------------------------------------------

  function Is_Extension_Present
    ( ADevice: in Device;
      Ext_Name: in String
    ) return Bool
  is
    function alcIsExtensionPresent
      ( ADevice: in Device;
        Ext_Name: in CStrings.chars_ptr
      ) return Bool
      with Import => True, Convention => StdCall,
           External_Name => "alcIsExtensionPresent";

    CString: CStrings.char_array_access :=
      new IC.char_array'(IC.To_C (Ext_Name));

    Success: Bool;
  begin
    Success := alcIsExtensionPresent (ADevice, CStrings.To_Chars_Ptr (CString));
    Free (CString);
    return Success;
  end Is_Extension_Present;

  ---------------------------------------------------------------------------

  function Get_Proc_Address
    ( ADevice: in Device;
      Func_Name: in String
    ) return Pointer
  is
    function alcGetProcAddress
      ( ADevice: in Device;
        Func_Name: in CStrings.chars_ptr
      ) return Pointer
      with Import => True, Convention => StdCall,
           External_Name => "alcGetProcAddress";

    CString: CStrings.char_array_access :=
      new IC.char_array'(IC.To_C (Func_Name));

    Address: Pointer;
  begin
    Address := alcGetProcAddress (ADevice, CStrings.To_Chars_Ptr (CString));
    Free (CString);
    return Address;
  end Get_Proc_Address;

  ---------------------------------------------------------------------------

  function Get_Enum_Value
    ( ADevice: in Device;
      Enum_Name: in String
    ) return Enum
  is
    function alcGetEnumValue
      ( ADevice: in Device;
        Enum_Name: in CStrings.chars_ptr
      ) return Enum
      with Import => True, Convention => StdCall,
           External_Name => "alcGetEnumValue";

    CString: CStrings.char_array_access :=
      new IC.char_array'(IC.To_C (Enum_Name));

    Value: Enum;
  begin
    Value := alcGetEnumValue (ADevice, CStrings.To_Chars_Ptr (CString));
    Free (CString);
    return Value;
  end Get_Enum_Value;

  ---------------------------------------------------------------------------

  function Get_String (ADevice: in Device; Param: in Enum) return String
  is
    function alcGetString
      ( ADevice: in Device;
        Param: in Enum
      ) return CStrings.chars_ptr
      with Import => True, Convention => StdCall,
           External_Name => "alcGetString";
  begin
    return IC.To_Ada (CStrings.Value (alcGetString (ADevice, Param)));
  end Get_String;

  ---------------------------------------------------------------------------

  function Capture_Open_Device
    ( Device_Name: in String;
      Frequency: in UInt;
      Format: in Enum;
      Buffer_Size: in SizeI
    ) return Device
  is
    function alcCaptureOpenDevice
      ( Device_Name: in CStrings.chars_ptr;
        Frequency: in UInt;
        Format: in Enum;
        Buffer_Size: in SizeI
      ) return Device
    with Import => True, Convention => StdCall,
         External_Name => "alcCaptureOpenDevice";

    CString: CStrings.char_array_access :=
      new IC.char_array'(IC.To_C (Device_Name));

    ADevice: Device;
  begin
    ADevice :=
      alcCaptureOpenDevice
        ( CStrings.To_Chars_Ptr (CString),
          Frequency,
          Format,
          Buffer_Size
        );
    Free (CString);
    return ADevice;
  end Capture_Open_Device;

  ---------------------------------------------------------------------------

end Oto.ALC;
