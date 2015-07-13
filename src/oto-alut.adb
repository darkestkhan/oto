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
    pragma Import (StdCall, alutInit, "alutInit");

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
    pragma Import (StdCall, alutInitWithoutContext, "alutInitWithoutContext");

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
    pragma Import (StdCall, alutGetErrorString, "alutGetErrorString");
  begin
    return IC.To_Ada (CStrings.Value (alutGetErrorString (Error)));
  end Get_Error_String;

  ---------------------------------------------------------------------------

  function Create_Buffer_From_File (File_Name: in String) return AL.UInt
  is
    function alutCreateBufferFromFile (F: in CStrings.chars_ptr) return AL.UInt;
    pragma Import
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
    pragma Import (StdCall, alutLoadMemoryFromFile, "alutLoadMemoryFromFile");

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
    pragma Import (StdCall, alutGetMIMETypes, "alutGetMIMETypes");
  begin
    return IC.To_Ada (CStrings.Value (alutGetMIMETypes (Loader)));
  end Get_MIME_Types;

  ---------------------------------------------------------------------------

end Oto.ALUT;
