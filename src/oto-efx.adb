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

package body Oto.EFX is

  ---------------------------------------------------------------------------

              -------------------------------------------
              -- S U B P R O G R A M S '   B O D I E S --
              -------------------------------------------

  ---------------------------------------------------------------------------

  procedure Effect (Effect: in AL.UInt; Param: in AL.Enum; Value: in AL.Int)
  is
    procedure alEffecti
      ( Effect: in AL.UInt;
        Param : in AL.Enum;
        Value : in AL.Int
      );
    pragma Import (StdCall, alEffecti, "alEffecti");
  begin
    alEffecti (Effect, Param, Value);
  end Effect;

  ---------------------------------------------------------------------------

  procedure Effect (Effect: in AL.UInt; Param: in AL.Enum; Value: in Float)
  is
    procedure alEffectf
      ( Effect: in AL.UInt;
        Param : in AL.Enum;
        Value : in Float
      );
    pragma Import (StdCall, alEffectf, "alEffectf");
  begin
    alEffectf (Effect, Param, Value);
  end Effect;

  ---------------------------------------------------------------------------

  procedure Filter (Filter: in AL.UInt; Param: in AL.Enum; Value: in AL.Int)
  is
    procedure alFilteri
      ( Filter: in AL.UInt;
        Param : in AL.Enum;
        Value : in AL.Int
      );
    pragma Import (StdCall, alFilteri, "alFilteri");
  begin
    alFilteri (Filter, Param, Value);
  end Filter;

  ---------------------------------------------------------------------------

  procedure Filter (Filter: in AL.UInt; Param: in AL.Enum; Value: in Float)
  is
    procedure alFilterf
      ( Filter: in AL.UInt;
        Param : in AL.Enum;
        Value : in Float
      );
    pragma Import (StdCall, alFilterf, "alFilterf");
  begin
    alFilterf (Filter, Param, Value);
  end Filter;

  ---------------------------------------------------------------------------

  procedure Auxiliary_Effect_Slot
    ( Effect_Slot : in AL.UInt;
      Param       : in AL.Enum;
      Value       : in AL.Int
    )
  is
    procedure alAuxiliaryEffectSloti
      ( Effect_Slot : in AL.UInt;
        Param       : in AL.Enum;
        Value       : in AL.Int
      );
    pragma Import (StdCall, alAuxiliaryEffectSloti, "alAuxiliaryEffectSloti");
  begin
    alAuxiliaryEffectSloti (Effect_Slot, Param, Value);
  end Auxiliary_Effect_Slot;

  ---------------------------------------------------------------------------

  procedure Auxiliary_Effect_Slot
    ( Effect_Slot : in AL.UInt;
      Param       : in AL.Enum;
      Value       : in Float
    )
  is
    procedure alAuxiliaryEffectSlotf
      ( Effect_Slot : in AL.UInt;
        Param       : in AL.Enum;
        Value       : in Float
      );
    pragma Import (StdCall, alAuxiliaryEffectSlotf, "alAuxiliaryEffectSlotf");
  begin
    alAuxiliaryEffectSlotf (Effect_Slot, Param, Value);
  end Auxiliary_Effect_Slot;

  ---------------------------------------------------------------------------

end Oto.EFX;
