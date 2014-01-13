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
  subtype Double  is Long_Float;
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
  -- Type: Bool
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

                        ---------------------------
                        -- S U B P R O G R A M S --
                        ---------------------------

  ---------------------------------------------------------------------------
  -- Renderer State management
  procedure Enable (Capability: in Enum);

  procedure Disable (Capability: in Enum);

  function Is_Enabled (Capability: in Enum) return Bool;

  -- State retrieval
  function Get_String (Param: in Enum) return String;
  Pragma Inline (Get_String);

  procedure Get_Boolean (Param: in Enum; Data: in Pointer);

  function Get_Boolean (Param: in Enum) return Bool;
  Pragma Inline (Get_Boolean);

  procedure Get_Integer (Param: in Enum; Data: in Pointer);

  function Get_Integer (Param: in Enum) return Int;
  Pragma Inline (Get_Integer);

  procedure Get_Float (Param: in Enum; Data: in Pointer);

  function Get_Float (Param: in Enum) return Float;
  Pragma Inline (Get_Float);

  procedure Get_Double (Param: in Enum; Data: in Pointer);

  function Get_Double (Param: in Enum) return Double;
  Pragma Inline (Get_Double);

  -- Error support.
  -- Obtain the most recent error generated in the AL state machine.
  function Get_Error return Enum;

  -- Extension support.
  -- Query for the presence of an extension, and obtain any appropriate
  -- function pointers and enum values.
  function Is_Extension_Present (Ext_Name: in String) return Bool;
  Pragma Inline (Is_Extension_Present);

  function Get_Proc_Address (FName: in String) return Pointer;
  Pragma Inline (Get_Proc_Address);

  function Get_Enum_Value (EName: in String) return Enum;
  Pragma Inline (Get_Enum_Value);

 -- LISTENER
 -- Listener represents the location and orientation of the
 -- 'user' in 3D-space.
 --
 -- Properties include: -
 --
 -- Gain         AL_GAIN         Float
 -- Position     AL_POSITION     Float[3]
 -- Velocity     AL_VELOCITY     Float[3]
 -- Orientation  AL_ORIENTATION  Float[6] (Forward then Up vectors)

 -- Set Listener parameters
  procedure Listener (Param: in Enum; Value: in Float);

  procedure Listener
    ( Param: in Enum;
      Value1: in Float;
      Value2: in Float;
      Value3: in Float
    );

  procedure Listener (Param: in Enum; Value: in Int);

  procedure Listener
    ( Param: in Enum;
      Value1: in Int;
      Value2: in Int;
      Value3: in Int
    );
  Pragma Inline (Listener);

  procedure Listener_FV (Param: in Enum; Values: in Pointer);

  procedure Listener_IV (Param: in Enum; Values: in Pointer);

 -- Get Listener parameters
  procedure Get_Listener_F (Param: in Enum; Value: in Pointer);

  procedure Get_Listener_3F
    ( Param: in Enum;
      Value1: in Pointer;
      Value2: in Pointer;
      Value3: in Pointer
    );

  procedure Get_Listener_FV (Param: in Enum; Values: in Pointer);

  procedure Get_Listener_I (Param: in Enum; Value: in Pointer);

  procedure Get_Listener_3I
    ( Param: in Enum;
      Value1: in Pointer;
      Value2: in Pointer;
      Value3: in Pointer
    );

  procedure Get_Listener_IV (Param: in Enum; Values: in Pointer);

  -- SOURCE
  -- Sources represent individual sound objects in 3D-space.
  -- Sources take the PCM data provided in the specified Buffer,
  -- apply Source-specific modifications, and then
  -- submit them to be mixed according to spatial arrangement etc.
  --
  -- Properties include: -
  --
  -- Gain                              AL_GAIN                 Float
  -- Min Gain                          AL_MIN_GAIN             Float
  -- Max Gain                          AL_MAX_GAIN             Float
  -- Position                          AL_POSITION             Float[3]
  -- Velocity                          AL_VELOCITY             Float[3]
  -- Direction                         AL_DIRECTION            Float[3]
  -- Head Relative Mode                AL_SOURCE_RELATIVE      Int (AL_TRUE or AL_FALSE)
  -- Reference Distance                AL_REFERENCE_DISTANCE   Float
  -- Max Distance                      AL_MAX_DISTANCE         Float
  -- RollOff Factor                    AL_ROLLOFF_FACTOR       Float
  -- Inner Angle                       AL_CONE_INNER_ANGLE     Int or Float
  -- Outer Angle                       AL_CONE_OUTER_ANGLE     Int or Float
  -- Cone Outer Gain                   AL_CONE_OUTER_GAIN      Int or Float
  -- Pitch                             AL_PITCH                Float
  -- Looping                           AL_LOOPING              Bool (AL_TRUE or AL_FALSE)
  -- MS Offset                         AL_MSEC_OFFSET          Int or Float
  -- Byte Offset                       AL_BYTE_OFFSET          Int or Float
  -- Sample Offset                     AL_SAMPLE_OFFSET        Int or Float
  -- Attached Buffer                   AL_BUFFER               Int
  -- State (Query only)                AL_SOURCE_STATE         Int
  -- Buffers Queued (Query only)       AL_BUFFERS_QUEUED       Int
  -- Buffers Processed (Query only)    AL_BUFFERS_PROCESSED    Int

  -- Create Source objects
  procedure Gen_Sources (N: in SizeI; Sources: in Pointer);

  -- Delete Source objects
  procedure Delete_Sources (N: in SizeI; Sources: in Pointer);

  -- Verify a handle is a valid Source
  function Is_Source (SID: in UInt) return Bool;

  -- Set Source parameters
  procedure Source (SID: in UInt; Param: in Enum; Value: in Float);

  procedure Source
    ( SID: in UInt;
      Param: in Enum;
      Value1: in Float;
      Value2: in Float;
      Value3: in Float
    );

  procedure Source (SID: in UInt; Param: in Enum; Value: in Int);

  procedure Source
    ( SID: in UInt;
      Param: in Enum;
      Value1: in Int;
      Value2: in Int;
      Value3: in Int
    );
  Pragma Inline (Source);

  procedure Source_FV (SID: in UInt; Param: in Enum; Values: in Pointer);

  procedure Source_IV (SID: in UInt; Param: in Enum; Values: in Pointer);

 -- Get Source parameters
  procedure Get_Source_F (SID: in UInt; Param: in Enum; Value: in Pointer);

  procedure Get_Source_3F
    ( SID: in UInt;
      Param: in Enum;
      Value1: in Pointer;
      Value2: in Pointer;
      Value3: in Pointer
    );

  procedure Get_Source_FV (SID: in UInt; Param: in Enum; Values: in Pointer);

  procedure Get_Source_I (SID: in UInt; Param: in Enum; Value: in Pointer);

  procedure Get_Source_3I
    ( SID: in UInt;
      Param: in Enum;
      Value1: in Pointer;
      Value2: in Pointer;
      Value3: in Pointer
    );

  procedure Get_Source_IV (SID: in UInt; Param: in Enum; Values: in Pointer);

  -- Source playback calls

  -- Play, replay, or resume (if paused) Source (or list of them)
  procedure Source_Play (NS: in SizeI; SIDs: in Pointer);

  procedure Source_Play (SID: in UInt);
  Pragma Inline (Source_Play);

  -- Stop a Source (or list of them)
  procedure Source_Stop (NS: in SizeI; SIDs: in Pointer);

  procedure Source_Stop (SID: in UInt);
  Pragma Inline (Source_Stop);

  -- Rewind a Source (or list of them)
  procedure Source_Rewind (NS: in SizeI; SIDs: in Pointer);

  procedure Source_Rewind (SID: in UInt);
  Pragma Inline (Source_Rewind);

  -- Pause a Source (or list of them)
  procedure Source_Pause (NS: in SizeI; SIds: in Pointer);

  procedure Source_Pause (SID: in UInt);
  Pragma Inline (Source_Pause);

  -- Source Queuing 
  procedure Source_Queue_Buffers
    ( SID: in UInt;
      Num_Entries: in SizeI;
      BIDs: in Pointer
    );

  procedure Source_Unqueue_Buffers
    ( SID: in UInt;
      Num_Entries: in SizeI;
      BIDs: in Pointer
    );

  -- BUFFER
  -- Buffer objects are storage space for sample data.
  -- Buffers are referred to by Sources. One Buffer can be used
  -- by multiple Sources.
  --
  -- Properties include: -
  --
  -- Frequency (Query only)    AL_FREQUENCY      Int
  -- Size (Query only)         AL_SIZE           Int
  -- Bits (Query only)         AL_BITS           Int
  -- Channels (Query only)     AL_CHANNELS       Int

  -- Create Buffer objects
  procedure Gen_Buffers (N: in SizeI; Buffers: in Pointer);

  -- Delete Buffer objects
  procedure Delete_Buffers (N: in SizeI; Buffers: in Pointer);

  -- Verify a handle is a valid Buffer
  function Is_Buffer (BID: in UInt) return Bool;

  -- Specify the data to be copied into a buffer
  procedure Buffer_Data
    ( BID: in UInt;
      Format: in Enum;
      Data: in Pointer;
      Size: in SizeI;
      Freq: in SizeI
    );

  -- Set Buffer parameters
  procedure Buffer (BID: in UInt; Param: in Enum; Value: in Float);

  procedure Buffer
    ( BID: in UInt;
      Param: in Enum;
      Value1: in Float;
      Value2: in Float;
      Value3: in Float
    );

  procedure Buffer (BID: in UInt; Param: in Enum; Value: in Int);

  procedure Buffer
    ( BID: in UInt;
      Param: in Enum;
      Value1: in Int;
      Value2: in Int;
      Value3: in Int
    );
  Pragma Inline (Buffer);

  procedure Buffer_FV (BID: in UInt; Param: in Enum; Values: in Pointer);

  procedure Buffer_IV (BID: in UInt; Param: in Enum; Values: in Pointer);

  -- Get Buffer parameters
  procedure Get_Buffer_F (BID: in UInt; Value: in Pointer);

  procedure Get_Buffer_3F
    ( BID: in UInt;
      Param: in Enum;
      Value1: in Pointer;
      Value2: in Pointer;
      Value3: in Pointer
    );

  procedure Get_Buffer_FV (BID: in UInt; Param: in Enum; Values: in Float);

  procedure Get_Buffer_I (BID: in UInt; Param: in Enum; Value: in Pointer);

  procedure Get_Buffer_3I
    ( BID: in UInt;
      Param: in Enum;
      Value1: in Pointer;
      Value2: in Pointer;
      Value3: in Pointer
    );

  procedure Get_Buffer_IV (BID: in UInt; Param: in Enum; Values: in Pointer);

  -- Global Parameters
  procedure Doppler_Factor (Value: in Float);

  procedure Doppler_Velocity (Value: in Float);

  procedure Speed_Of_Sound (Value: in Float);

  procedure Distance_Model (Distance_Model: in Enum);

  ---------------------------------------------------------------------------

  -- NOTE: Pointer to function types are not bound.

  ---------------------------------------------------------------------------

private

  ---------------------------------------------------------------------------

                            -------------------
                            -- I M P O R T S --
                            -------------------

  ---------------------------------------------------------------------------

  Pragma Import (StdCall, Enable, "alEnable");
  Pragma Import (StdCall, Disable, "alDisable");
  Pragma Import (StdCall, Is_Enabled, "alIsEnabled");
  Pragma Import (StdCall, Get_Error, "alGetError");
  Pragma Import (StdCall, Listener_FV, "alListenerfv");
  Pragma Import (StdCall, Listener_IV, "alListeneriv");
  Pragma Import (StdCall, Get_Listener_F, "alGetListenerf");
  Pragma Import (StdCall, Get_Listener_3F, "alGetListener3f");
  Pragma Import (StdCall, Get_Listener_FV, "alGetListenerfv");
  Pragma Import (StdCall, Get_Listener_I, "alGetListeneri");
  Pragma Import (StdCall, Get_Listener_3I, "alGetListener3i");
  Pragma Import (StdCall, Get_Listener_IV, "alGetListeneriv");
  Pragma Import (StdCall, Gen_Sources, "alGenSources");
  Pragma Import (StdCall, Delete_Sources, "alDeleteSources");
  Pragma Import (StdCall, Is_Source, "alIsSource");
  Pragma Import (StdCall, Source_FV, "alSourcefv");
  Pragma Import (StdCall, Source_IV, "alSourceiv");
  Pragma Import (StdCall, Get_Source_F, "alGetSourcef");
  Pragma Import (StdCall, Get_Source_3F, "alGetSource3f");
  Pragma Import (StdCall, Get_Source_FV, "alGetSourcefv");
  Pragma Import (StdCall, Get_Source_I, "alGetSourcei");
  Pragma Import (StdCall, Get_Source_3I, "alGetSource3i");
  Pragma Import (StdCall, Get_Source_IV, "alGetSourceiv");
  Pragma Import (StdCall, Source_Queue_Buffers, "alSourceQueueBuffers");
  Pragma Import (StdCall, Source_Unqueue_Buffers, "alSourceUnqueueBuffers");
  Pragma Import (StdCall, Gen_Buffers, "alGenBuffers");
  Pragma Import (StdCall, Delete_Buffers, "alDeleteBuffers");
  Pragma Import (StdCall, Is_Buffer, "alIsBuffer");
  Pragma Import (StdCall, Buffer_Data, "alBufferData");
  Pragma Import (StdCall, Buffer_FV, "alBufferfv");
  Pragma Import (StdCall, Buffer_IV, "alBufferiv");
  Pragma Import (StdCall, Get_Buffer_F, "alGetBufferf");
  Pragma Import (StdCall, Get_Buffer_3F, "alGetBuffer3f");
  Pragma Import (StdCall, Get_Buffer_FV, "alGetBufferfv");
  Pragma Import (StdCall, Get_Buffer_I, "alGetBufferi");
  Pragma Import (StdCall, Get_Buffer_3I, "alGetBuffer3i");
  Pragma Import (StdCall, Get_Buffer_IV, "alGetBufferiv");
  Pragma Import (StdCall, Doppler_Factor, "alDopplerFactor");
  Pragma Import (StdCall, Doppler_Velocity, "alDopplerVelocity");
  Pragma Import (StdCall, Speed_Of_Sound, "alSpeedOfSound");
  Pragma Import (StdCall, Distance_Model, "alDistanceModel");

  ---------------------------------------------------------------------------

end Oto.AL;
