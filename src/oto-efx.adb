pragma License (Modified_GPL);
------------------------------------------------------------------------------
-- EMAIL: <darkestkhan@gmail.com>                                           --
-- License: Modified GNU GPLv3 or any later as published by Free Software   --
--  Foundation (GMGPL, see COPYING file).                                   --
--                                                                          --
--                    Copyright © 2014 - 2015 darkestkhan                   --
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
