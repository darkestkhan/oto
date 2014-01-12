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

package Oto.AL is

  ---------------------------------------------------------------------------

                            ---------------
                            -- T Y P E S --
                            ---------------

  ---------------------------------------------------------------------------

  subtype Bool    is Binary.Byte;
  subtype Byte    is Binary.S_Byte;
  subtype Chat    is Binary.Byte;
  subtype Enum    is Binary.S_Word;
  subtype Int     is Integer;
  subtype Short   is Binary.S_Short;
  subtype SizeI   is Integer;
  subtype UByte   is Binary.Byte;
  subtype UInt    is Binary.Word;
  subtype UShort  is Binary.Short;
  subtype Pointer is System.Address;

  ---------------------------------------------------------------------------

                        -----------------------
                        -- C O N S T A N T S --
                        -----------------------

  ---------------------------------------------------------------------------

  -- "no distance model" or "no buffer"
  AL_NONE                                   : constant Enum := 0;

  AL_FALSE                                  : constant Bool := 0;
  AL_TRUE                                   : constant Bool := 1;

  -- Indicate Source has relative coordinates.
  AL_SOURCE_RELATIVE                        : constant Enum := 16#202#;

  -- Directional source, inner cone angle, in degrees.
  -- Range:    [0-360] 
  -- Default:  360
  AL_CONE_INNER_ANGLE                       : constant Enum := 16#1001#;

  -- Directional source, outer cone angle, in degrees.
  -- Range:    [0-360] 
  -- Default:  360
  AL_CONE_OUTER_ANGLE                       : constant Enum := 16#1002#;

  -- Specify the pitch to be applied at source.
  -- Range:   [0.5-2.0]
  -- Default: 1.0
  AL_PITCH                                  : constant Enum := 16#1003#;

  -- Specify the current location in three dimensional space.
  -- OpenAL, like OpenGL, uses a right handed coordinate system,
  --  where in a frontal default view X (thumb) points right, 
  --  Y points up (index finger), and Z points towards the
  --  viewer/camera (middle finger). 
  -- To switch from a left handed coordinate system, flip the
  --  sign on the Z coordinate.
  -- Listener position is always in the world coordinate system.
  AL_POSITION                               : constant Enum := 16#1004#;

  -- Specify the current direction.
  AL_DIRECTION                              : constant Enum := 16#1005#;

  -- Specify the current velocity in three dimensional space.
  AL_VELOCITY                               : constant Enum := 16#1006#;

  -- Indicate whether source is looping.
  -- Type: ALboolean
  -- Range:   [AL_TRUE, AL_FALSE]
  -- Default: FALSE.
  AL_LOOPING                                : constant Enum := 16#1007#;

  -- Indicate the buffer to provide sound samples. 
  -- Type: ALuint.
  -- Range: any valid Buffer id.
  AL_BUFFER                                 : constant Enum := 16#1009#;

  -- Indicate the gain (volume amplification) applied. 
  -- Type:  Float.
  -- Range:  ]0.0-  ]
  -- A value of 1.0 means un-attenuated/unchanged.
  -- Each division by 2 equals an attenuation of -6dB.
  -- Each multiplicaton with 2 equals an amplification of +6dB.
  -- A value of 0.0 is meaningless with respect to a logarithmic
  -- scale; it is interpreted as zero volume - the channel
  -- is effectively disabled.
  AL_GAIN                                   : constant Enum := 16#100A#;

  -- Indicate minimum source attenuation
  -- Type: Float
  -- Range:  [0.0 - 1.0]
  --
  -- Logarthmic
  AL_MIN_GAIN                               : constant Enum := 16#100D#;

  -- Indicate maximum source attenuation
  -- Type: Float
  -- Range:  [0.0 - 1.0]
  --
  -- Logarthmic
  AL_MAX_GAIN                               : constant Enum := 16#100E#;

  -- Indicate listener orientation.
  --
  -- at/up 
  AL_ORIENTATION                            : constant Enum := 16#100F#;

  -- Source state information.
  AL_SOURCE_STATE                           : constant Enum := 16#1010#;
  AL_INITIAL                                : constant Enum := 16#1011#;
  AL_PLAYING                                : constant Enum := 16#1012#;
  AL_PAUSED                                 : constant Enum := 16#1013#;
  AL_STOPPED                                : constant Enum := 16#1014#;

  -- Buffer Queue params
  AL_BUFFERS_QUEUED                         : constant Enum := 16#1015#;
  AL_BUFFERS_PROCESSED                      : constant Enum := 16#1016#;

  -- Source buffer position information
  AL_SEC_OFFSET                             : constant Enum := 16#1024#;
  AL_SAMPLE_OFFSET                          : constant Enum := 16#1025#;
  AL_BYTE_OFFSET                            : constant Enum := 16#1026#;

  -- Source type (Static, Streaming or undetermined)
  -- Source is Static if a Buffer has been attached using AL_BUFFER
  -- Source is Streaming if one or more Buffers have been attached using alSourceQueueBuffers
  -- Source is undetermined when it has the NULL buffer attached
  AL_SOURCE_TYPE                            : constant Enum := 16#1027#;
  AL_STATIC                                 : constant Enum := 16#1028#;
  AL_STREAMING                              : constant Enum := 16#1029#;
  AL_UNDETERMINED                           : constant Enum := 16#1030#;

  -- Sound samples: format specifier.
  AL_FORMAT_MONO8                           : constant Enum := 16#1100#;
  AL_FORMAT_MONO16                          : constant Enum := 16#1101#;
  AL_FORMAT_STEREO8                         : constant Enum := 16#1102#;
  AL_FORMAT_STEREO16                        : constant Enum := 16#1103#;

  -- source specific reference distance
  -- Type: Float
  -- Range:  0.0 - +inf
  --
  -- At 0.0, no distance attenuation occurs.  Default is 1.0.
  AL_REFERENCE_DISTANCE                     : constant Enum := 16#1020#;

  -- source specific rolloff factor
  -- Type: Float
  -- Range:  0.0 - +inf
  AL_ROLLOFF_FACTOR                         : constant Enum := 16#1021#;

  -- Directional source, outer cone gain.
  --
  -- Default:  0.0
  -- Range:    [0.0 - 1.0]
  -- Logarithmic
  AL_CONE_OUTER_GAIN                        : constant Enum := 16#1022#;

  -- Indicate distance above which sources are not
  -- attenuated using the inverse clamped distance model.
  --
  -- Default: +inf
  -- Type: Float
  -- Range:  0.0 - +inf
  AL_MAX_DISTANCE                           : constant Enum := 16#1023#;

  -- Sound samples: frequency, in units of Hertz [Hz].
  -- This is the number of samples per second. Half of the
  --  sample frequency marks the maximum significant
  --  frequency component.
  AL_FREQUENCY                              : constant Enum := 16#2001#;
  AL_BITS                                   : constant Enum := 16#2002#;
  AL_CHANNELS                               : constant Enum := 16#2003#;
  AL_SIZE                                   : constant Enum := 16#2004#;

  -- Buffer state.
  --
  -- Not supported for public use (yet).
  AL_UNUSED                                 : constant Enum := 16#2010#;
  AL_PENDING                                : constant Enum := 16#2011#;
  AL_PROCESSED                              : constant Enum := 16#2012#;

  -- Errors: No Error.
  AL_NO_ERROR                               : constant Enum := 0;

  -- Invalid Name paramater passed to AL call.
  AL_INVALID_NAME                           : constant Enum := 16#A001#;

  -- Invalid parameter passed to AL call.
  AL_INVALID_ENUM                           : constant Enum := 16#A002#;

  -- Invalid enum parameter value.
  AL_INVALID_VALUE                          : constant Enum := 16#A003#;

  -- Illegal call.
  AL_INVALID_OPERATION                      : constant Enum := 16#A004#;

  
  -- No mojo.
  AL_OUT_OF_MEMORY                          : constant Enum := 16#A005#;

  -- Context strings: Vendor Name.
  AL_VENDOR                                 : constant Enum := 16#B001#;
  AL_VERSION                                : constant Enum := 16#B002#;
  AL_RENDERER                               : constant Enum := 16#B003#;
  AL_EXTENSIONS                             : constant Enum := 16#B004#;

  -- Doppler scale.  Default 1.0
  AL_DOPPLER_FACTOR                         : constant Enum := 16#C000#;

  -- Tweaks speed of propagation.
  AL_DOPPLER_VELOCITY                       : constant Enum := 16#C001#;

  -- Speed of Sound in units per second
  AL_SPEED_OF_SOUND                         : constant Enum := 16#C003#;

  -- Distance models
  --
  -- used in conjunction with DistanceModel
  --
  -- implicit: NONE, which disances distance attenuation.
  AL_DISTANCE_MODEL                         : constant Enum := 16#D000#;
  AL_INVERSE_DISTANCE                       : constant Enum := 16#D001#;
  AL_INVERSE_DISTANCE_CLAMPED               : constant Enum := 16#D002#;
  AL_LINEAR_DISTANCE                        : constant Enum := 16#D003#;
  AL_LINEAR_DISTANCE_CLAMPED                : constant Enum := 16#D004#;
  AL_EXPONENT_DISTANCE                      : constant Enum := 16#D005#;
  AL_EXPONENT_DISTANCE_CLAMPED              : constant Enum := 16#D006#;

  ---------------------------------------------------------------------------

end Oto.AL;
