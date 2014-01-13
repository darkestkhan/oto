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

with Interfaces.C;
with Interfaces.C.Strings;
package body Oto.ALUT is

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

  function Init (Arguments: in String_Array) return AL.Bool
  is
    function alutInit
      ( Argcp : in AL.Pointer;
        Argv  : in CStrings.chars_ptr_array
      ) return AL.Bool;
    Pragma Import (StdCall, alutInit, "alutInit");

    Argcp : constant AL.Int := AL.Int (Arguments'Length);

    CString: CStrings.char_array_access;

    Success: AL.Bool;
  begin
    if Arguments'Length /= 0 then
      declare
        Argv: CStrings.chars_ptr_array (0 .. IC.size_t (Arguments'Length - 1));
      begin
        for K in Argv'Range loop
          CString := new
            IC.char_array'(IC.To_C
              ( Arguments (Arguments'First + Natural (K)).all) );
          Argv (K) := CStrings.To_Chars_Ptr (CString);
          Free (CString);
        end loop;

        Success := alutInit (Argcp'Address, Argv);

        for K in Argv'Range loop
          CStrings.Free (Argv (K));
        end loop;
      end;
    else
      declare
        Argv : CStrings.chars_ptr_array (1 .. 0);
      begin
        Success := alutInit (Argcp'Address, Argv);
      end;
    end if;
    return Success;
  end Init;

  ---------------------------------------------------------------------------

  function Init_Without_Context (Arguments: in String_Array) return AL.Bool
  is
    function alutInitWithoutContext
      ( Argcp : in AL.Pointer;
        Argv  : in CStrings.chars_ptr_array
      ) return AL.Bool;
    Pragma Import (StdCall, alutInitWithoutContext, "alutInitWithoutContext");

    Argcp : constant AL.Int := AL.Int (Arguments'Length);

    CString: CStrings.char_array_access;

    Success: AL.Bool;
  begin
    if Arguments'Length /= 0 then
      declare
        Argv: CStrings.chars_ptr_array (0 .. IC.size_t (Arguments'Length - 1));
      begin
        for K in Argv'Range loop
          CString := new
            IC.char_array'(IC.To_C
              ( Arguments (Arguments'First + Natural (K)).all) );
          Argv (K) := CStrings.To_Chars_Ptr (CString);
          Free (CString);
        end loop;

        Success := alutInitWithoutContext (Argcp'Address, Argv);

        for K in Argv'Range loop
          CStrings.Free (Argv (K));
        end loop;
      end;
    else
      declare
        Argv : CStrings.chars_ptr_array (1 .. 0);
      begin
        Success := alutInitWithoutContext (Argcp'Address, Argv);
      end;
    end if;
    return Success;
  end Init_Without_Context;

  ---------------------------------------------------------------------------

  function Get_Error_String (Error: in AL.Enum) return String
  is
    function alutGetErrorString (Error: in AL.Enum) return CStrings.chars_ptr;
    Pragma Import (StdCall, alutGetErrorString, "alutGetErrorString");
  begin
    return IC.To_Ada (CStrings.Value (alutGetErrorString (Error)));
  end Get_Error_String;

  ---------------------------------------------------------------------------

  function Create_Buffer_From_File (File_Name: in String) return AL.UInt
  is
    function alutCreateBufferFromFile (F: in CStrings.chars_ptr) return AL.UInt;
    Pragma Import
    ( StdCall, alutCreateBufferFromFile, "alutCreateBufferFromFile" );

    CString: CStrings.char_array_access :=
      new IC.char_array'(IC.To_C (File_Name));

    Buffer: AL.UInt;
  begin
    Buffer := alutCreateBufferFromFile (CStrings.To_Chars_Ptr (CString));
    Free (CString);
    return Buffer;
  end Create_Buffer_From_File;

  ---------------------------------------------------------------------------

  function Load_Memory_From_File
    ( File_Name : in String;
      Format    : in AL.Pointer;
      Size      : in AL.Pointer;
      Frequency : in AL.Pointer
    ) return AL.Pointer
  is
    function alutLoadMemoryFromFile
      ( File_Name : in CStrings.chars_ptr;
        Format    : in AL.Pointer;
        Size      : in AL.Pointer;
        Frequency : in AL.Pointer
      ) return AL.Pointer;
    Pragma Import (StdCall, alutLoadMemoryFromFile, "alutLoadMemoryFromFile");

    CString: CStrings.char_array_access :=
      new IC.char_array'(IC.To_C (File_Name));

    Address: AL.Pointer;
  begin
    Address :=
      alutLoadMemoryFromFile
        ( CStrings.To_Chars_Ptr (CString),
          Format,
          Size,
          Frequency
        );
    Free (CString);
    return Address;
  end Load_Memory_From_File;

  ---------------------------------------------------------------------------

  function Get_MIME_Types (Loader: in AL.Enum) return String
  is
    function alutGetMIMETypes (Loader: in AL.Enum) return CStrings.chars_ptr;
    Pragma Import (StdCall, alutGetMIMETypes, "alutGetMIMETypes");
  begin
    return IC.To_Ada (CStrings.Value (alutGetMIMETypes (Loader)));
  end Get_MIME_Types;

  ---------------------------------------------------------------------------

end Oto.ALUT;
