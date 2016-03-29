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
with System;

with Oto.Binary;
use Oto;

use type Oto.Binary.S_Word;
package Oto.AL is

  ---------------------------------------------------------------------------

                            ---------------
                            -- T Y P E S --
                            ---------------

  ---------------------------------------------------------------------------

  subtype Bool    is Binary.Byte;
  subtype Byte    is Binary.S_Byte;
  subtype Char    is Binary.Byte;
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
  -- Source is Streaming if one or more Buffers have been attached using
  --  alSourceQueueBuffers
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

  ---------------------------------------------------------------------------

                            -----------------
                            -- E R R O R S --
                            -----------------

  ---------------------------------------------------------------------------

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

  ---------------------------------------------------------------------------

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
  procedure Enable (Capability: in Enum)
    with Import => True, Convention => StdCall, External_Name => "alEnable";

  procedure Disable (Capability: in Enum)
    with Import => True, Convention => StdCall, External_Name => "alDisable";

  function Is_Enabled (Capability: in Enum) return Bool
    with Import => True, Convention => StdCall, External_Name => "alIsEnabled";

  -- State retrieval
  function Get_String (Param: in Enum) return String
    with Inline => True,
         Pre => Param in AL_VENDOR .. AL_EXTENSIONS or Param = AL_NO_ERROR or
                Param in AL_INVALID_NAME .. AL_OUT_OF_MEMORY;

  procedure Get_Boolean (Param: in Enum; Data: in Pointer)
    with Import => True, Convention => StdCall,
         External_Name => "alGetBooleanv",
         Pre => Param in AL_DOPPLER_FACTOR | AL_SPEED_OF_SOUND |
                         AL_DISTANCE_MODEL;

  function Get_Boolean (Param: in Enum) return Bool
    with Import => True, Convention => StdCall,
         External_Name => "alGetBoolean",
         Pre => Param in AL_DOPPLER_FACTOR | AL_SPEED_OF_SOUND |
                         AL_DISTANCE_MODEL;

  procedure Get_Integer (Param: in Enum; Data: in Pointer)
    with Import => True, Convention => StdCall,
         External_Name => "alGetIntegerv",
         Pre => Param in AL_DOPPLER_FACTOR | AL_SPEED_OF_SOUND |
                         AL_DISTANCE_MODEL;

  function Get_Integer (Param: in Enum) return Int
    with Import => True, Convention => StdCall,
         External_Name => "alGetInteger",
         Pre => Param in AL_DOPPLER_FACTOR | AL_SPEED_OF_SOUND |
                         AL_DISTANCE_MODEL;

  procedure Get_Float (Param: in Enum; Data: in Pointer)
    with Import => True, Convention => StdCall,
         External_Name => "alGetFloatv",
         Pre => Param in AL_DOPPLER_FACTOR | AL_SPEED_OF_SOUND |
                         AL_DISTANCE_MODEL;

  function Get_Float (Param: in Enum) return Float
    with Import => True, Convention => StdCall,
         External_Name => "alGetFloat",
         Pre => Param in AL_DOPPLER_FACTOR | AL_SPEED_OF_SOUND |
                         AL_DISTANCE_MODEL;

  procedure Get_Double (Param: in Enum; Data: in Pointer)
    with Import => True, Convention => StdCall,
         External_Name => "alGetDoublev",
         Pre => Param in AL_DOPPLER_FACTOR | AL_SPEED_OF_SOUND |
                         AL_DISTANCE_MODEL;

  function Get_Double (Param: in Enum) return Double
    with Import => True, Convention => StdCall,
         External_Name => "alGetDouble",
         Pre => Param in AL_DOPPLER_FACTOR | AL_SPEED_OF_SOUND |
                         AL_DISTANCE_MODEL;

  -- Error support.
  -- Obtain the most recent error generated in the AL state machine.
  function Get_Error return Enum
    with Import => True, Convention => StdCall, External_Name => "alGetError";

  -- Extension support.
  -- Query for the presence of an extension, and obtain any appropriate
  -- function pointers and enum values.
  function Is_Extension_Present (Ext_Name: in String) return Bool
    with Inline => True;

  function Get_Proc_Address (FName: in String) return Pointer
    with Inline => True;

  function Get_Enum_Value (EName: in String) return Enum
    with Inline => True;

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
  procedure Listener (Param: in Enum; Value: in Float)
    with Import => True, Convention => StdCall,
         External_Name => "alListenerf",
         Pre => Param in AL_POSITION | AL_GAIN | AL_VELOCITY | AL_ORIENTATION;

  procedure Listener
    ( Param: in Enum;
      Value1: in Float;
      Value2: in Float;
      Value3: in Float
    )
    with Import => True, Convention => StdCall,
         External_Name => "alListener3f",
         Pre => Param in AL_POSITION | AL_GAIN | AL_VELOCITY | AL_ORIENTATION;

  procedure Listener (Param: in Enum; Value: in Int)
    with Import => True, Convention => StdCall,
         External_Name => "alListeneri",
         Pre => Param in AL_POSITION | AL_GAIN | AL_VELOCITY | AL_ORIENTATION;

  procedure Listener
    ( Param: in Enum;
      Value1: in Int;
      Value2: in Int;
      Value3: in Int
    )
    with Import => True, Convention => StdCall,
         External_Name => "alListener3i",
         Pre => Param in AL_POSITION | AL_GAIN | AL_VELOCITY | AL_ORIENTATION;

  procedure Listener_FV (Param: in Enum; Values: in Pointer)
    with Import => True, Convention => StdCall, External_Name => "alListenerfv",
         Pre => Param in AL_POSITION | AL_GAIN | AL_VELOCITY | AL_ORIENTATION;

  procedure Listener_IV (Param: in Enum; Values: in Pointer)
    with Import => True, Convention => StdCall, External_Name => "alListeneriv",
         Pre => Param in AL_POSITION | AL_GAIN | AL_VELOCITY | AL_ORIENTATION;

  -- Get Listener parameters
  procedure Get_Listener_F (Param: in Enum; Value: in Pointer)
    with Import => True, Convention => StdCall,
         External_Name => "alGetListenerf",
         Pre => Param in AL_POSITION | AL_GAIN | AL_VELOCITY | AL_ORIENTATION;

  procedure Get_Listener_3F
    ( Param: in Enum;
      Value1: in Pointer;
      Value2: in Pointer;
      Value3: in Pointer
    )
    with Import => True, Convention => StdCall,
         External_Name => "alGetListener3f",
         Pre => Param in AL_POSITION | AL_GAIN | AL_VELOCITY | AL_ORIENTATION;

  procedure Get_Listener_FV (Param: in Enum; Values: in Pointer)
    with Import => True, Convention => StdCall,
         External_Name => "alGetListenerfv",
         Pre => Param in AL_POSITION | AL_GAIN | AL_VELOCITY | AL_ORIENTATION;

  procedure Get_Listener_I (Param: in Enum; Value: in Pointer)
    with Import => True, Convention => StdCall,
         External_Name => "alGetListeneri",
         Pre => Param in AL_POSITION | AL_GAIN | AL_VELOCITY | AL_ORIENTATION;

  procedure Get_Listener_3I
    ( Param: in Enum;
      Value1: in Pointer;
      Value2: in Pointer;
      Value3: in Pointer
    )
    with Import => True, Convention => StdCall,
         External_Name => "alGetListener3i",
         Pre => Param in AL_POSITION | AL_GAIN | AL_VELOCITY | AL_ORIENTATION;

  procedure Get_Listener_IV (Param: in Enum; Values: in Pointer)
    with Import => True, Convention => StdCall,
         External_Name => "alGetListeneriv",
         Pre => Param in AL_POSITION | AL_GAIN | AL_VELOCITY | AL_ORIENTATION;

  -- SOURCE
  -- Sources represent individual sound objects in 3D-space.
  -- Sources take the PCM data provided in the specified Buffer,
  -- apply Source-specific modifications, and then
  -- submit them to be mixed according to spatial arrangement etc.
  --
  -- Properties include: -
  --
  -- Gain                     AL_GAIN                 Float
  -- Min Gain                 AL_MIN_GAIN             Float
  -- Max Gain                 AL_MAX_GAIN             Float
  -- Position                 AL_POSITION             Float[3]
  -- Velocity                 AL_VELOCITY             Float[3]
  -- Direction                AL_DIRECTION            Float[3]
  -- Head Relative Mode       AL_SOURCE_RELATIVE      Int (AL_TRUE or AL_FALSE)
  -- Reference Distance       AL_REFERENCE_DISTANCE   Float
  -- Max Distance             AL_MAX_DISTANCE         Float
  -- RollOff Factor           AL_ROLLOFF_FACTOR       Float
  -- Inner Angle              AL_CONE_INNER_ANGLE     Int or Float
  -- Outer Angle              AL_CONE_OUTER_ANGLE     Int or Float
  -- Cone Outer Gain          AL_CONE_OUTER_GAIN      Int or Float
  -- Pitch                    AL_PITCH                Float
  -- Looping                  AL_LOOPING              Bool (AL_TRUE or AL_FALSE)
  -- MS Offset                AL_SEC_OFFSET           Int or Float
  -- Byte Offset              AL_BYTE_OFFSET          Int or Float
  -- Sample Offset            AL_SAMPLE_OFFSET        Int or Float
  -- Attached Buffer          AL_BUFFER               Int
  -- State (Query only)       AL_SOURCE_STATE         Int
  -- Buffers Queued (Query only)    AL_BUFFERS_QUEUED       Int
  -- Buffers Processed (Query only) AL_BUFFERS_PROCESSED    Int

  -- Create Source objects
  procedure Gen_Sources (N: in SizeI; Sources: in Pointer)
    with Import => True, Convention => StdCall, External_Name => "alGenSources";

  -- Delete Source objects
  procedure Delete_Sources (N: in SizeI; Sources: in Pointer)
    with Import => True, Convention => StdCall,
         External_Name => "alDeleteSources";

  -- Verify a handle is a valid Source
  function Is_Source (SID: in UInt) return Bool
    with Import => True, Convention => StdCall, External_Name => "alIsSource";

  -- Set Source parameters
  procedure Source (SID: in UInt; Param: in Enum; Value: in Float)
    with Import => True, Convention => StdCall,
         External_Name => "alSourcef",
         Pre => Param in  AL_GAIN | AL_MIN_GAIN | AL_MAX_GAIN | AL_POSITION |
                          AL_VELOCITY | AL_DIRECTION | AL_SOURCE_RELATIVE |
                          AL_REFERENCE_DISTANCE | AL_MAX_DISTANCE |
                          AL_ROLLOFF_FACTOR | AL_CONE_INNER_ANGLE |
                          AL_CONE_OUTER_ANGLE | AL_CONE_OUTER_GAIN |
                          AL_PITCH | AL_LOOPING | AL_SEC_OFFSET |
                          AL_BYTE_OFFSET | AL_SAMPLE_OFFSET | AL_BUFFER;

  procedure Source
    ( SID: in UInt;
      Param: in Enum;
      Value1: in Float;
      Value2: in Float;
      Value3: in Float
    )
    with Import => True, Convention => StdCall,
         External_Name => "alSource3f",
         Pre => Param in  AL_GAIN | AL_MIN_GAIN | AL_MAX_GAIN | AL_POSITION |
                          AL_VELOCITY | AL_DIRECTION | AL_SOURCE_RELATIVE |
                          AL_REFERENCE_DISTANCE | AL_MAX_DISTANCE |
                          AL_ROLLOFF_FACTOR | AL_CONE_INNER_ANGLE |
                          AL_CONE_OUTER_ANGLE | AL_CONE_OUTER_GAIN |
                          AL_PITCH | AL_LOOPING | AL_SEC_OFFSET |
                          AL_BYTE_OFFSET | AL_SAMPLE_OFFSET | AL_BUFFER;

  procedure Source (SID: in UInt; Param: in Enum; Value: in Int)
    with Import => True, Convention => StdCall,
         External_Name => "alSourcei",
         Pre => Param in  AL_GAIN | AL_MIN_GAIN | AL_MAX_GAIN | AL_POSITION |
                          AL_VELOCITY | AL_DIRECTION | AL_SOURCE_RELATIVE |
                          AL_REFERENCE_DISTANCE | AL_MAX_DISTANCE |
                          AL_ROLLOFF_FACTOR | AL_CONE_INNER_ANGLE |
                          AL_CONE_OUTER_ANGLE | AL_CONE_OUTER_GAIN |
                          AL_PITCH | AL_LOOPING | AL_SEC_OFFSET |
                          AL_BYTE_OFFSET | AL_SAMPLE_OFFSET | AL_BUFFER;

  procedure Source
    ( SID: in UInt;
      Param: in Enum;
      Value1: in Int;
      Value2: in Int;
      Value3: in Int
    )
    with Import => True, Convention => StdCall,
         External_Name => "alSource3i",
         Pre => Param in  AL_GAIN | AL_MIN_GAIN | AL_MAX_GAIN | AL_POSITION |
                          AL_VELOCITY | AL_DIRECTION | AL_SOURCE_RELATIVE |
                          AL_REFERENCE_DISTANCE | AL_MAX_DISTANCE |
                          AL_ROLLOFF_FACTOR | AL_CONE_INNER_ANGLE |
                          AL_CONE_OUTER_ANGLE | AL_CONE_OUTER_GAIN |
                          AL_PITCH | AL_LOOPING | AL_SEC_OFFSET |
                          AL_BYTE_OFFSET | AL_SAMPLE_OFFSET | AL_BUFFER;

  procedure Source_FV (SID: in UInt; Param: in Enum; Values: in Pointer)
    with Import => True, Convention => StdCall, External_Name => "alSourcefv",
         Pre => Param in  AL_GAIN | AL_MIN_GAIN | AL_MAX_GAIN | AL_POSITION |
                          AL_VELOCITY | AL_DIRECTION | AL_SOURCE_RELATIVE |
                          AL_REFERENCE_DISTANCE | AL_MAX_DISTANCE |
                          AL_ROLLOFF_FACTOR | AL_CONE_INNER_ANGLE |
                          AL_CONE_OUTER_ANGLE | AL_CONE_OUTER_GAIN |
                          AL_PITCH | AL_LOOPING | AL_SEC_OFFSET |
                          AL_BYTE_OFFSET | AL_SAMPLE_OFFSET | AL_BUFFER;

  procedure Source_IV (SID: in UInt; Param: in Enum; Values: in Pointer)
    with Import => True, Convention => StdCall, External_Name => "alSourceiv",
         Pre => Param in  AL_GAIN | AL_MIN_GAIN | AL_MAX_GAIN | AL_POSITION |
                          AL_VELOCITY | AL_DIRECTION | AL_SOURCE_RELATIVE |
                          AL_REFERENCE_DISTANCE | AL_MAX_DISTANCE |
                          AL_ROLLOFF_FACTOR | AL_CONE_INNER_ANGLE |
                          AL_CONE_OUTER_ANGLE | AL_CONE_OUTER_GAIN |
                          AL_PITCH | AL_LOOPING | AL_SEC_OFFSET |
                          AL_BYTE_OFFSET | AL_SAMPLE_OFFSET | AL_BUFFER;

  -- Get Source parameters
  procedure Get_Source_F (SID: in UInt; Param: in Enum; Value: in Pointer)
    with Import => True, Convention => StdCall, External_Name => "alGetSourcef",
         Pre => Param in  AL_GAIN | AL_MIN_GAIN | AL_MAX_GAIN | AL_POSITION |
                          AL_VELOCITY | AL_DIRECTION | AL_SOURCE_RELATIVE |
                          AL_REFERENCE_DISTANCE | AL_MAX_DISTANCE |
                          AL_ROLLOFF_FACTOR | AL_CONE_INNER_ANGLE |
                          AL_CONE_OUTER_ANGLE | AL_CONE_OUTER_GAIN |
                          AL_PITCH | AL_LOOPING | AL_SEC_OFFSET |
                          AL_BYTE_OFFSET | AL_SAMPLE_OFFSET | AL_BUFFER |
                          AL_SOURCE_STATE | AL_BUFFERS_QUEUED |
                          AL_BUFFERS_PROCESSED;

  procedure Get_Source_3F
    ( SID: in UInt;
      Param: in Enum;
      Value1: in Pointer;
      Value2: in Pointer;
      Value3: in Pointer
    )
    with Import => True, Convention => StdCall,
         External_Name => "alGetSource3f",
         Pre => Param in  AL_GAIN | AL_MIN_GAIN | AL_MAX_GAIN | AL_POSITION |
                          AL_VELOCITY | AL_DIRECTION | AL_SOURCE_RELATIVE |
                          AL_REFERENCE_DISTANCE | AL_MAX_DISTANCE |
                          AL_ROLLOFF_FACTOR | AL_CONE_INNER_ANGLE |
                          AL_CONE_OUTER_ANGLE | AL_CONE_OUTER_GAIN |
                          AL_PITCH | AL_LOOPING | AL_SEC_OFFSET |
                          AL_BYTE_OFFSET | AL_SAMPLE_OFFSET | AL_BUFFER |
                          AL_SOURCE_STATE | AL_BUFFERS_QUEUED |
                          AL_BUFFERS_PROCESSED;

  procedure Get_Source_FV (SID: in UInt; Param: in Enum; Values: in Pointer)
    with Import => True, Convention => StdCall,
         External_Name => "alGetSourcefv",
         Pre => Param in  AL_GAIN | AL_MIN_GAIN | AL_MAX_GAIN | AL_POSITION |
                          AL_VELOCITY | AL_DIRECTION | AL_SOURCE_RELATIVE |
                          AL_REFERENCE_DISTANCE | AL_MAX_DISTANCE |
                          AL_ROLLOFF_FACTOR | AL_CONE_INNER_ANGLE |
                          AL_CONE_OUTER_ANGLE | AL_CONE_OUTER_GAIN |
                          AL_PITCH | AL_LOOPING | AL_SEC_OFFSET |
                          AL_BYTE_OFFSET | AL_SAMPLE_OFFSET | AL_BUFFER |
                          AL_SOURCE_STATE | AL_BUFFERS_QUEUED |
                          AL_BUFFERS_PROCESSED;

  procedure Get_Source_I (SID: in UInt; Param: in Enum; Value: in Pointer)
    with Import => True, Convention => StdCall, External_Name => "alGetSourcei",
         Pre => Param in  AL_GAIN | AL_MIN_GAIN | AL_MAX_GAIN | AL_POSITION |
                          AL_VELOCITY | AL_DIRECTION | AL_SOURCE_RELATIVE |
                          AL_REFERENCE_DISTANCE | AL_MAX_DISTANCE |
                          AL_ROLLOFF_FACTOR | AL_CONE_INNER_ANGLE |
                          AL_CONE_OUTER_ANGLE | AL_CONE_OUTER_GAIN |
                          AL_PITCH | AL_LOOPING | AL_SEC_OFFSET |
                          AL_BYTE_OFFSET | AL_SAMPLE_OFFSET | AL_BUFFER |
                          AL_SOURCE_STATE | AL_BUFFERS_QUEUED |
                          AL_BUFFERS_PROCESSED;

  procedure Get_Source_3I
    ( SID: in UInt;
      Param: in Enum;
      Value1: in Pointer;
      Value2: in Pointer;
      Value3: in Pointer
    )
    with Import => True, Convention => StdCall,
         External_Name => "alGetSource3i",
         Pre => Param in  AL_GAIN | AL_MIN_GAIN | AL_MAX_GAIN | AL_POSITION |
                          AL_VELOCITY | AL_DIRECTION | AL_SOURCE_RELATIVE |
                          AL_REFERENCE_DISTANCE | AL_MAX_DISTANCE |
                          AL_ROLLOFF_FACTOR | AL_CONE_INNER_ANGLE |
                          AL_CONE_OUTER_ANGLE | AL_CONE_OUTER_GAIN |
                          AL_PITCH | AL_LOOPING | AL_SEC_OFFSET |
                          AL_BYTE_OFFSET | AL_SAMPLE_OFFSET | AL_BUFFER |
                          AL_SOURCE_STATE | AL_BUFFERS_QUEUED |
                          AL_BUFFERS_PROCESSED;

  procedure Get_Source_IV (SID: in UInt; Param: in Enum; Values: in Pointer)
    with Import => True, Convention => StdCall,
         External_Name => "alGetSourceiv",
         Pre => Param in  AL_GAIN | AL_MIN_GAIN | AL_MAX_GAIN | AL_POSITION |
                          AL_VELOCITY | AL_DIRECTION | AL_SOURCE_RELATIVE |
                          AL_REFERENCE_DISTANCE | AL_MAX_DISTANCE |
                          AL_ROLLOFF_FACTOR | AL_CONE_INNER_ANGLE |
                          AL_CONE_OUTER_ANGLE | AL_CONE_OUTER_GAIN |
                          AL_PITCH | AL_LOOPING | AL_SEC_OFFSET |
                          AL_BYTE_OFFSET | AL_SAMPLE_OFFSET | AL_BUFFER |
                          AL_SOURCE_STATE | AL_BUFFERS_QUEUED |
                          AL_BUFFERS_PROCESSED;

  -- Source playback calls

  -- Play, replay, or resume (if paused) Source (or list of them)
  procedure Source_Play (NS: in SizeI; SIDs: in Pointer)
    with Import => True, Convention => StdCall,
         External_Name => "alSourcePlayv";

  procedure Source_Play (SID: in UInt)
    with Import => True, Convention => StdCall,
         External_Name => "alSourcePlay";

  -- Stop a Source (or list of them)
  procedure Source_Stop (NS: in SizeI; SIDs: in Pointer)
    with Import => True, Convention => StdCall,
         External_Name => "alSourceStopv";

  procedure Source_Stop (SID: in UInt)
    with Import => True, Convention => StdCall,
         External_Name => "alSourceStop";

  -- Rewind a Source (or list of them)
  procedure Source_Rewind (NS: in SizeI; SIDs: in Pointer)
    with Import => True, Convention => StdCall,
         External_Name => "alSourceRewindv";

  procedure Source_Rewind (SID: in UInt)
    with Import => True, Convention => StdCall,
         External_Name => "alSourceRewind";

  -- Pause a Source (or list of them)
  procedure Source_Pause (NS: in SizeI; SIds: in Pointer)
    with Import => True, Convention => StdCall,
         External_Name => "alSourcePausev";

  procedure Source_Pause (SID: in UInt)
    with Import => True, Convention => StdCall,
         External_Name => "alSourcePause";

  -- Source Queuing
  procedure Source_Queue_Buffers
    ( SID: in UInt;
      Num_Entries: in SizeI;
      BIDs: in Pointer
    )
    with Import => True, Convention => StdCall,
         External_Name => "alSourceQueueBuffers";

  procedure Source_Unqueue_Buffers
    ( SID: in UInt;
      Num_Entries: in SizeI;
      BIDs: in Pointer
    )
    with Import => True, Convention => StdCall,
         External_Name => "alSourceUnqueueBuffers";

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
  procedure Gen_Buffers (N: in SizeI; Buffers: in Pointer)
    with Import => True, Convention => StdCall, External_Name => "alGenBuffers";

  -- Delete Buffer objects
  procedure Delete_Buffers (N: in SizeI; Buffers: in Pointer)
    with Import => True, Convention => StdCall,
         External_Name => "alDeleteBuffers";

  -- Verify a handle is a valid Buffer
  function Is_Buffer (BID: in UInt) return Bool
    with Import => True, Convention => StdCall,
         External_Name => "alIsBuffer";

  -- Specify the data to be copied into a buffer
  procedure Buffer_Data
    ( BID: in UInt;
      Format: in Enum;
      Data: in Pointer;
      Size: in SizeI;
      Freq: in SizeI
    )
    with Import => True, Convention => StdCall,
         External_Name => "alBufferData",
         Pre => Size >= 0 and Freq > 0 and
                Format in AL_FORMAT_MONO8 .. AL_FORMAT_STEREO16 and
                (if Format in AL_FORMAT_MONO16 | AL_FORMAT_STEREO16
                 then Size mod 2 = 0);

  -- Set Buffer parameters
  procedure Buffer (BID: in UInt; Param: in Enum; Value: in Float)
    with Import => True, Convention => StdCall, External_Name => "alBufferf";

  procedure Buffer
    ( BID: in UInt;
      Param: in Enum;
      Value1: in Float;
      Value2: in Float;
      Value3: in Float
    )
    with Import => True, Convention => StdCall, External_Name => "alBuffer3f";

  procedure Buffer (BID: in UInt; Param: in Enum; Value: in Int)
    with Import => True, Convention => StdCall, External_Name => "alBufferi";

  procedure Buffer
    ( BID: in UInt;
      Param: in Enum;
      Value1: in Int;
      Value2: in Int;
      Value3: in Int
    )
    with Import => True, Convention => StdCall, External_Name => "alBuffer3i";

  procedure Buffer_FV (BID: in UInt; Param: in Enum; Values: in Pointer)
    with Import => True, Convention => StdCall, External_Name => "alBufferfv";

  procedure Buffer_IV (BID: in UInt; Param: in Enum; Values: in Pointer)
    with Import => True, Convention => StdCall, External_Name => "alBufferiv";

  -- Get Buffer parameters
  procedure Get_Buffer_F (BID: in UInt; Param: in Enum; Value: in Pointer)
    with Import => True, Convention => StdCall, External_Name => "alGetBufferf",
         Pre => Param in AL_FREQUENCY | AL_SIZE | AL_BITS | AL_CHANNELS;

  procedure Get_Buffer_3F
    ( BID: in UInt;
      Param: in Enum;
      Value1: in Pointer;
      Value2: in Pointer;
      Value3: in Pointer
    )
    with Import => True, Convention => StdCall,
         External_Name => "alGetBuffer3f",
         Pre => Param in AL_FREQUENCY | AL_SIZE | AL_BITS | AL_CHANNELS;

  procedure Get_Buffer_FV (BID: in UInt; Param: in Enum; Values: in Float)
    with Import => True, Convention => StdCall,
         External_Name => "alGetBufferfv",
         Pre => Param in AL_FREQUENCY | AL_SIZE | AL_BITS | AL_CHANNELS;

  procedure Get_Buffer_I (BID: in UInt; Param: in Enum; Value: in Pointer)
    with Import => True, Convention => StdCall, External_Name => "alGetBufferi",
         Pre => Param in AL_FREQUENCY | AL_SIZE | AL_BITS | AL_CHANNELS;

  procedure Get_Buffer_3I
    ( BID: in UInt;
      Param: in Enum;
      Value1: in Pointer;
      Value2: in Pointer;
      Value3: in Pointer
    )
    with Import => True, Convention => StdCall,
         External_Name => "alGetBuffer3i",
         Pre => Param in AL_FREQUENCY | AL_SIZE | AL_BITS | AL_CHANNELS;

  procedure Get_Buffer_IV (BID: in UInt; Param: in Enum; Values: in Pointer)
    with Import => True, Convention => StdCall,
         External_Name => "alGetBufferiv",
         Pre => Param in AL_FREQUENCY | AL_SIZE | AL_BITS | AL_CHANNELS;

  -- Global Parameters
  procedure Doppler_Factor (Value: in Float)
    with Import => True, Convention => StdCall,
         External_Name => "alDopplerFactor",
         Pre => Value >= 0.0;

  procedure Doppler_Velocity (Value: in Float)
    with Import => True, Convention => StdCall,
         External_Name => "alDopplerVelocity",
         Pre => Value > 0.0;

  procedure Speed_Of_Sound (Value: in Float)
    with Import => True, Convention => StdCall,
         External_Name => "alSpeedOfSound",
         Pre => Value > 0.0;

  procedure Distance_Model (ADistance_Model: in Enum)
    with Import => True, Convention => StdCall,
         External_Name => "alDistanceModel",
         Pre => ADistance_Model = AL_NONE or
                ADistance_Model in
                  AL_INVERSE_DISTANCE .. AL_EXPONENT_DISTANCE_CLAMPED;

  ---------------------------------------------------------------------------

end Oto.AL;
