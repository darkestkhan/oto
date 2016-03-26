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
    function alGetString (Param: in Enum) return CStrings.chars_ptr
      with Import => True, Convention => StdCall,
           External_Name => "alGetString";
  begin
    return IC.To_Ada (CStrings.Value (alGetString (Param)));
  end Get_String;

  ---------------------------------------------------------------------------

  function Is_Extension_Present (Ext_Name: in String) return Bool
  is
    function alIsExtensionPresent (extname: in CStrings.chars_ptr) return Bool
      with Import => True, Convention => StdCall,
           External_Name => "alIsExtensionPresent";

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
    function alGetProcAddress (fname: in CStrings.chars_ptr) return Pointer
      with Import => True, Convention => StdCall,
           External_Name => "alGetProcAddress";

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
    function alGetEnumValue (EName: in CStrings.chars_ptr) return Enum
      with Import => True, Convention => StdCall,
           External_Name => "alGetEnumValue";

    CString: CStrings.char_array_access :=
      new IC.char_array'(IC.To_C (EName));

    Value: Enum;
  begin
    Value := alGetEnumValue (CStrings.To_Chars_Ptr (CString));
    Free (CString);
    return Value;
  end Get_Enum_Value;

  ---------------------------------------------------------------------------

end Oto.AL;
