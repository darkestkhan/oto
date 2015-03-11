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
    function alcOpenDevice (Device_Name: in CStrings.chars_ptr) return Device;
    pragma Import (StdCall, alcOpenDevice, "alcOpenDevice");

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
      ) return Bool;
    pragma Import (StdCall, alcIsExtensionPresent, "alcIsExtensionPresent");

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
      ) return Pointer;
    pragma Import (StdCall, alcGetProcAddress, "alcGetProcAddress");

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
      ) return Enum;
    pragma Import (StdCall, alcGetEnumValue, "alcGetEnumValue");

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
      ) return CStrings.chars_ptr;
    pragma Import (StdCall, alcGetString, "alcGetString");
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
      ) return Device;
    pragma Import (StdCall, alcCaptureOpenDevice, "alcCaptureOpenDevice");

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
