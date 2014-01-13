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
with Oto.AL;
with Oto.ALC;
use Oto;

use type Oto.AL.Enum;
package Oto.EFX is

  ---------------------------------------------------------------------------

                        -----------------------
                        -- C O N S T A N T S --
                        -----------------------

  ---------------------------------------------------------------------------

  ALC_EXT_EFX_NAME                         : constant String := "ALC_EXT_EFX";

  ALC_EFX_MAJOR_VERSION                    : constant ALC.Enum := 16#20001#;
  ALC_EFX_MINOR_VERSION                    : constant ALC.Enum := 16#20002#;
  ALC_MAX_AUXILIARY_SENDS                  : constant ALC.Enum := 16#20003#;

  -- Listener properties.
  AL_METERS_PER_UNIT                       : constant AL.Enum := 16#20004#;

  -- Source properties.
  AL_DIRECT_FILTER                         : constant AL.Enum := 16#20005#;
  AL_AUXILIARY_SEND_FILTER                 : constant AL.Enum := 16#20006#;
  AL_AIR_ABSORPTION_FACTOR                 : constant AL.Enum := 16#20007#;
  AL_ROOM_ROLLOFF_FACTOR                   : constant AL.Enum := 16#20008#;
  AL_CONE_OUTER_GAINHF                     : constant AL.Enum := 16#20009#;
  AL_DIRECT_FILTER_GAINHF_AUTO             : constant AL.Enum := 16#2000A#;
  AL_AUXILIARY_SEND_FILTER_GAIN_AUTO       : constant AL.Enum := 16#2000B#;
  AL_AUXILIARY_SEND_FILTER_GAINHF_AUTO     : constant AL.Enum := 16#2000C#;

  -- Effect properties.
  -- Reverb effect parameters
  AL_REVERB_DENSITY                        : constant AL.Enum := 16#0001#;
  AL_REVERB_DIFFUSION                      : constant AL.Enum := 16#0002#;
  AL_REVERB_GAIN                           : constant AL.Enum := 16#0003#;
  AL_REVERB_GAINHF                         : constant AL.Enum := 16#0004#;
  AL_REVERB_DECAY_TIME                     : constant AL.Enum := 16#0005#;
  AL_REVERB_DECAY_HFRATIO                  : constant AL.Enum := 16#0006#;
  AL_REVERB_REFLECTIONS_GAIN               : constant AL.Enum := 16#0007#;
  AL_REVERB_REFLECTIONS_DELAY              : constant AL.Enum := 16#0008#;
  AL_REVERB_LATE_REVERB_GAIN               : constant AL.Enum := 16#0009#;
  AL_REVERB_LATE_REVERB_DELAY              : constant AL.Enum := 16#000A#;
  AL_REVERB_AIR_ABSORPTION_GAINHF          : constant AL.Enum := 16#000B#;
  AL_REVERB_ROOM_ROLLOFF_FACTOR            : constant AL.Enum := 16#000C#;
  AL_REVERB_DECAY_HFLIMIT                  : constant AL.Enum := 16#000D#;

  -- EAX Reverb effect parameters
  AL_EAXREVERB_DENSITY                     : constant AL.Enum := 16#0001#;
  AL_EAXREVERB_DIFFUSION                   : constant AL.Enum := 16#0002#;
  AL_EAXREVERB_GAIN                        : constant AL.Enum := 16#0003#;
  AL_EAXREVERB_GAINHF                      : constant AL.Enum := 16#0004#;
  AL_EAXREVERB_GAINLF                      : constant AL.Enum := 16#0005#;
  AL_EAXREVERB_DECAY_TIME                  : constant AL.Enum := 16#0006#;
  AL_EAXREVERB_DECAY_HFRATIO               : constant AL.Enum := 16#0007#;
  AL_EAXREVERB_DECAY_LFRATIO               : constant AL.Enum := 16#0008#;
  AL_EAXREVERB_REFLECTIONS_GAIN            : constant AL.Enum := 16#0009#;
  AL_EAXREVERB_REFLECTIONS_DELAY           : constant AL.Enum := 16#000A#;
  AL_EAXREVERB_REFLECTIONS_PAN             : constant AL.Enum := 16#000B#;
  AL_EAXREVERB_LATE_REVERB_GAIN            : constant AL.Enum := 16#000C#;
  AL_EAXREVERB_LATE_REVERB_DELAY           : constant AL.Enum := 16#000D#;
  AL_EAXREVERB_LATE_REVERB_PAN             : constant AL.Enum := 16#000E#;
  AL_EAXREVERB_ECHO_TIME                   : constant AL.Enum := 16#000F#;
  AL_EAXREVERB_ECHO_DEPTH                  : constant AL.Enum := 16#0010#;
  AL_EAXREVERB_MODULATION_TIME             : constant AL.Enum := 16#0011#;
  AL_EAXREVERB_MODULATION_DEPTH            : constant AL.Enum := 16#0012#;
  AL_EAXREVERB_AIR_ABSORPTION_GAINHF       : constant AL.Enum := 16#0013#;
  AL_EAXREVERB_HFREFERENCE                 : constant AL.Enum := 16#0014#;
  AL_EAXREVERB_LFREFERENCE                 : constant AL.Enum := 16#0015#;
  AL_EAXREVERB_ROOM_ROLLOFF_FACTOR         : constant AL.Enum := 16#0016#;
  AL_EAXREVERB_DECAY_HFLIMIT               : constant AL.Enum := 16#0017#;

  -- Chorus effect parameters
  AL_CHORUS_WAVEFORM                       : constant AL.Enum := 16#0001#;
  AL_CHORUS_PHASE                          : constant AL.Enum := 16#0002#;
  AL_CHORUS_RATE                           : constant AL.Enum := 16#0003#;
  AL_CHORUS_DEPTH                          : constant AL.Enum := 16#0004#;
  AL_CHORUS_FEEDBACK                       : constant AL.Enum := 16#0005#;
  AL_CHORUS_DELAY                          : constant AL.Enum := 16#0006#;

  -- Distortion effect parameters
  AL_DISTORTION_EDGE                       : constant AL.Enum := 16#0001#;
  AL_DISTORTION_GAIN                       : constant AL.Enum := 16#0002#;
  AL_DISTORTION_LOWPASS_CUTOFF             : constant AL.Enum := 16#0003#;
  AL_DISTORTION_EQCENTER                   : constant AL.Enum := 16#0004#;
  AL_DISTORTION_EQBANDWIDTH                : constant AL.Enum := 16#0005#;

  -- Echo effect parameters
  AL_ECHO_DELAY                            : constant AL.Enum := 16#0001#;
  AL_ECHO_LRDELAY                          : constant AL.Enum := 16#0002#;
  AL_ECHO_DAMPING                          : constant AL.Enum := 16#0003#;
  AL_ECHO_FEEDBACK                         : constant AL.Enum := 16#0004#;
  AL_ECHO_SPREAD                           : constant AL.Enum := 16#0005#;

  -- Flanger effect parameters
  AL_FLANGER_WAVEFORM                      : constant AL.Enum := 16#0001#;
  AL_FLANGER_PHASE                         : constant AL.Enum := 16#0002#;
  AL_FLANGER_RATE                          : constant AL.Enum := 16#0003#;
  AL_FLANGER_DEPTH                         : constant AL.Enum := 16#0004#;
  AL_FLANGER_FEEDBACK                      : constant AL.Enum := 16#0005#;
  AL_FLANGER_DELAY                         : constant AL.Enum := 16#0006#;

  -- Frequency shifter effect parameters
  AL_FREQUENCY_SHIFTER_FREQUENCY           : constant AL.Enum := 16#0001#;
  AL_FREQUENCY_SHIFTER_LEFT_DIRECTION      : constant AL.Enum := 16#0002#;
  AL_FREQUENCY_SHIFTER_RIGHT_DIRECTION     : constant AL.Enum := 16#0003#;

  -- Vocal morpher effect parameters
  AL_VOCAL_MORPHER_PHONEMEA                : constant AL.Enum := 16#0001#;
  AL_VOCAL_MORPHER_PHONEMEA_COARSE_TUNING  : constant AL.Enum := 16#0002#;
  AL_VOCAL_MORPHER_PHONEMEB                : constant AL.Enum := 16#0003#;
  AL_VOCAL_MORPHER_PHONEMEB_COARSE_TUNING  : constant AL.Enum := 16#0004#;
  AL_VOCAL_MORPHER_WAVEFORM                : constant AL.Enum := 16#0005#;
  AL_VOCAL_MORPHER_RATE                    : constant AL.Enum := 16#0006#;

  -- Pitchshifter effect parameters
  AL_PITCH_SHIFTER_COARSE_TUNE             : constant AL.Enum := 16#0001#;
  AL_PITCH_SHIFTER_FINE_TUNE               : constant AL.Enum := 16#0002#;

  -- Ringmodulator effect parameters
  AL_RING_MODULATOR_FREQUENCY              : constant AL.Enum := 16#0001#;
  AL_RING_MODULATOR_HIGHPASS_CUTOFF        : constant AL.Enum := 16#0002#;
  AL_RING_MODULATOR_WAVEFORM               : constant AL.Enum := 16#0003#;

  -- Autowah effect parameters
  AL_AUTOWAH_ATTACK_TIME                   : constant AL.Enum := 16#0001#;
  AL_AUTOWAH_RELEASE_TIME                  : constant AL.Enum := 16#0002#;
  AL_AUTOWAH_RESONANCE                     : constant AL.Enum := 16#0003#;
  AL_AUTOWAH_PEAK_GAIN                     : constant AL.Enum := 16#0004#;

  -- Compressor effect parameters
  AL_COMPRESSOR_ONOFF                      : constant AL.Enum := 16#0001#;

  -- Equalizer effect parameters
  AL_EQUALIZER_LOW_GAIN                    : constant AL.Enum := 16#0001#;
  AL_EQUALIZER_LOW_CUTOFF                  : constant AL.Enum := 16#0002#;
  AL_EQUALIZER_MID1_GAIN                   : constant AL.Enum := 16#0003#;
  AL_EQUALIZER_MID1_CENTER                 : constant AL.Enum := 16#0004#;
  AL_EQUALIZER_MID1_WIDTH                  : constant AL.Enum := 16#0005#;
  AL_EQUALIZER_MID2_GAIN                   : constant AL.Enum := 16#0006#;
  AL_EQUALIZER_MID2_CENTER                 : constant AL.Enum := 16#0007#;
  AL_EQUALIZER_MID2_WIDTH                  : constant AL.Enum := 16#0008#;
  AL_EQUALIZER_HIGH_GAIN                   : constant AL.Enum := 16#0009#;
  AL_EQUALIZER_HIGH_CUTOFF                 : constant AL.Enum := 16#000A#;

  -- Effect type
  AL_EFFECT_FIRST_PARAMETER                : constant AL.Enum := 16#0000#;
  AL_EFFECT_LAST_PARAMETER                 : constant AL.Enum := 16#8000#;
  AL_EFFECT_TYPE                           : constant AL.Enum := 16#8001#;

  -- Effect types, used with the AL_EFFECT_TYPE property
  AL_EFFECT_NULL                           : constant AL.Enum := 16#0000#;
  AL_EFFECT_REVERB                         : constant AL.Enum := 16#0001#;
  AL_EFFECT_CHORUS                         : constant AL.Enum := 16#0002#;
  AL_EFFECT_DISTORTION                     : constant AL.Enum := 16#0003#;
  AL_EFFECT_ECHO                           : constant AL.Enum := 16#0004#;
  AL_EFFECT_FLANGER                        : constant AL.Enum := 16#0005#;
  AL_EFFECT_FREQUENCY_SHIFTER              : constant AL.Enum := 16#0006#;
  AL_EFFECT_VOCAL_MORPHER                  : constant AL.Enum := 16#0007#;
  AL_EFFECT_PITCH_SHIFTER                  : constant AL.Enum := 16#0008#;
  AL_EFFECT_RING_MODULATOR                 : constant AL.Enum := 16#0009#;
  AL_EFFECT_AUTOWAH                        : constant AL.Enum := 16#000A#;
  AL_EFFECT_COMPRESSOR                     : constant AL.Enum := 16#000B#;
  AL_EFFECT_EQUALIZER                      : constant AL.Enum := 16#000C#;
  AL_EFFECT_EAXREVERB                      : constant AL.Enum := 16#8000#;

  -- Auxiliary Effect Slot properties.
  AL_EFFECTSLOT_EFFECT                     : constant AL.Enum := 16#0001#;
  AL_EFFECTSLOT_GAIN                       : constant AL.Enum := 16#0002#;
  AL_EFFECTSLOT_AUXILIARY_SEND_AUTO        : constant AL.Enum := 16#0003#;

  -- NULL Auxiliary Slot ID to disable a source send.
  AL_EFFECTSLOT_NULL                       : constant AL.Enum := 16#0000#;

  -- Filter properties.
  -- Lowpass filter parameters
  AL_LOWPASS_GAIN                          : constant AL.Enum := 16#0001#;
  AL_LOWPASS_GAINHF                        : constant AL.Enum := 16#0002#;

  -- Highpass filter parameters
  AL_HIGHPASS_GAIN                         : constant AL.Enum := 16#0001#;
  AL_HIGHPASS_GAINLF                       : constant AL.Enum := 16#0002#;

  -- Bandpass filter parameters
  AL_BANDPASS_GAIN                         : constant AL.Enum := 16#0001#;
  AL_BANDPASS_GAINLF                       : constant AL.Enum := 16#0002#;
  AL_BANDPASS_GAINHF                       : constant AL.Enum := 16#0003#;

  -- Filter type
  AL_FILTER_FIRST_PARAMETER                : constant AL.Enum := 16#0000#;
  AL_FILTER_LAST_PARAMETER                 : constant AL.Enum := 16#8000#;
  AL_FILTER_TYPE                           : constant AL.Enum := 16#8001#;

  -- Filter types, used with the AL_FILTER_TYPE property
  AL_FILTER_NULL                           : constant AL.Enum := 16#0000#;
  AL_FILTER_LOWPASS                        : constant AL.Enum := 16#0001#;
  AL_FILTER_HIGHPASS                       : constant AL.Enum := 16#0002#;
  AL_FILTER_BANDPASS                       : constant AL.Enum := 16#0003#;

  -- Filter ranges and defaults.
  -- Lowpass filter
  AL_LOWPASS_MIN_GAIN                      : constant Float := 0.0;
  AL_LOWPASS_MAX_GAIN                      : constant Float := 1.0;
  AL_LOWPASS_DEFAULT_GAIN                  : constant Float := 1.0;

  AL_LOWPASS_MIN_GAINHF                    : constant Float := 0.0;
  AL_LOWPASS_MAX_GAINHF                    : constant Float := 1.0;
  AL_LOWPASS_DEFAULT_GAINHF                : constant Float := 1.0;

  -- Highpass filter
  AL_HIGHPASS_MIN_GAIN                     : constant Float := 0.0;
  AL_HIGHPASS_MAX_GAIN                     : constant Float := 1.0;
  AL_HIGHPASS_DEFAULT_GAIN                 : constant Float := 1.0;

  AL_HIGHPASS_MIN_GAINLF                   : constant Float := 0.0;
  AL_HIGHPASS_MAX_GAINLF                   : constant Float := 1.0;
  AL_HIGHPASS_DEFAULT_GAINLF               : constant Float := 1.0;

  -- Bandpass filter
  AL_BANDPASS_MIN_GAIN                     : constant Float := 0.0;
  AL_BANDPASS_MAX_GAIN                     : constant Float := 1.0;
  AL_BANDPASS_DEFAULT_GAIN                 : constant Float := 1.0;

  AL_BANDPASS_MIN_GAINHF                   : constant Float := 0.0;
  AL_BANDPASS_MAX_GAINHF                   : constant Float := 1.0;
  AL_BANDPASS_DEFAULT_GAINHF               : constant Float := 1.0;

  AL_BANDPASS_MIN_GAINLF                   : constant Float := 0.0;
  AL_BANDPASS_MAX_GAINLF                   : constant Float := 1.0;
  AL_BANDPASS_DEFAULT_GAINLF               : constant Float := 1.0;

  -- Effect parameter ranges and defaults.
  -- Standard reverb effect
  AL_REVERB_MIN_DENSITY                    : constant Float := 0.0;
  AL_REVERB_MAX_DENSITY                    : constant Float := 1.0;
  AL_REVERB_DEFAULT_DENSITY                : constant Float := 1.0;

  AL_REVERB_MIN_DIFFUSION                  : constant Float := 0.0;
  AL_REVERB_MAX_DIFFUSION                  : constant Float := 1.0;
  AL_REVERB_DEFAULT_DIFFUSION              : constant Float := 1.0;

  AL_REVERB_MIN_GAIN                       : constant Float := 0.0;
  AL_REVERB_MAX_GAIN                       : constant Float := 1.0;
  AL_REVERB_DEFAULT_GAIN                   : constant Float := 0.32;

  AL_REVERB_MIN_GAINHF                     : constant Float := 0.0;
  AL_REVERB_MAX_GAINHF                     : constant Float := 1.0;
  AL_REVERB_DEFAULT_GAINHF                 : constant Float := 0.89;

  AL_REVERB_MIN_DECAY_TIME                 : constant Float := 0.1;
  AL_REVERB_MAX_DECAY_TIME                 : constant Float := 20.0;
  AL_REVERB_DEFAULT_DECAY_TIME             : constant Float := 1.49;

  AL_REVERB_MIN_DECAY_HFRATIO              : constant Float := 0.1;
  AL_REVERB_MAX_DECAY_HFRATIO              : constant Float := 2.0;
  AL_REVERB_DEFAULT_DECAY_HFRATIO          : constant Float := 0.83;

  AL_REVERB_MIN_REFLECTIONS_GAIN           : constant Float := 0.0;
  AL_REVERB_MAX_REFLECTIONS_GAIN           : constant Float := 3.16;
  AL_REVERB_DEFAULT_REFLECTIONS_GAIN       : constant Float := 0.05;

  AL_REVERB_MIN_REFLECTIONS_DELAY          : constant Float := 0.0;
  AL_REVERB_MAX_REFLECTIONS_DELAY          : constant Float := 0.3;
  AL_REVERB_DEFAULT_REFLECTIONS_DELAY      : constant Float := 0.007;

  AL_REVERB_MIN_LATE_REVERB_GAIN           : constant Float := 0.0;
  AL_REVERB_MAX_LATE_REVERB_GAIN           : constant Float := 10.0;
  AL_REVERB_DEFAULT_LATE_REVERB_GAIN       : constant Float := 1.26;

  AL_REVERB_MIN_LATE_REVERB_DELAY          : constant Float := 0.0;
  AL_REVERB_MAX_LATE_REVERB_DELAY          : constant Float := 0.1;
  AL_REVERB_DEFAULT_LATE_REVERB_DELAY      : constant Float := 0.011;

  AL_REVERB_MIN_AIR_ABSORPTION_GAINHF      : constant Float := 0.892;
  AL_REVERB_MAX_AIR_ABSORPTION_GAINHF      : constant Float := 1.0;
  AL_REVERB_DEFAULT_AIR_ABSORPTION_GAINHF  : constant Float := 0.994;

  AL_REVERB_MIN_ROOM_ROLLOFF_FACTOR        : constant Float := 0.0;
  AL_REVERB_MAX_ROOM_ROLLOFF_FACTOR        : constant Float := 10.0;
  AL_REVERB_DEFAULT_ROOM_ROLLOFF_FACTOR    : constant Float := 0.0;

  AL_REVERB_MIN_DECAY_HFLIMIT              : constant AL.Bool := AL.AL_FALSE;
  AL_REVERB_MAX_DECAY_HFLIMIT              : constant AL.Bool := AL.AL_TRUE;
  AL_REVERB_DEFAULT_DECAY_HFLIMIT          : constant AL.Bool := AL.AL_TRUE;

  -- EAX reverb effect
  AL_EAXREVERB_MIN_DENSITY                 : constant Float := 0.0;
  AL_EAXREVERB_MAX_DENSITY                 : constant Float := 1.0;
  AL_EAXREVERB_DEFAULT_DENSITY             : constant Float := 1.0;

  AL_EAXREVERB_MIN_DIFFUSION               : constant Float := 0.0;
  AL_EAXREVERB_MAX_DIFFUSION               : constant Float := 1.0;
  AL_EAXREVERB_DEFAULT_DIFFUSION           : constant Float := 1.0;

  AL_EAXREVERB_MIN_GAIN                    : constant Float := 0.0;
  AL_EAXREVERB_MAX_GAIN                    : constant Float := 1.0;
  AL_EAXREVERB_DEFAULT_GAIN                : constant Float := 0.32;

  AL_EAXREVERB_MIN_GAINHF                  : constant Float := 0.0;
  AL_EAXREVERB_MAX_GAINHF                  : constant Float := 1.0;
  AL_EAXREVERB_DEFAULT_GAINHF              : constant Float := 0.89;

  AL_EAXREVERB_MIN_GAINLF                  : constant Float := 0.0;
  AL_EAXREVERB_MAX_GAINLF                  : constant Float := 1.0;
  AL_EAXREVERB_DEFAULT_GAINLF              : constant Float := 1.0;

  AL_EAXREVERB_MIN_DECAY_TIME              : constant Float := 0.1;
  AL_EAXREVERB_MAX_DECAY_TIME              : constant Float := 20.0;
  AL_EAXREVERB_DEFAULT_DECAY_TIME          : constant Float := 1.49;

  AL_EAXREVERB_MIN_DECAY_HFRATIO           : constant Float := 0.1;
  AL_EAXREVERB_MAX_DECAY_HFRATIO           : constant Float := 2.0;
  AL_EAXREVERB_DEFAULT_DECAY_HFRATIO       : constant Float := 0.83;

  AL_EAXREVERB_MIN_DECAY_LFRATIO           : constant Float := 0.1;
  AL_EAXREVERB_MAX_DECAY_LFRATIO           : constant Float := 2.0;
  AL_EAXREVERB_DEFAULT_DECAY_LFRATIO       : constant Float := 1.0;

  AL_EAXREVERB_MIN_REFLECTIONS_GAIN        : constant Float := 0.0;
  AL_EAXREVERB_MAX_REFLECTIONS_GAIN        : constant Float := 3.16;
  AL_EAXREVERB_DEFAULT_REFLECTIONS_GAIN    : constant Float := 0.05;

  AL_EAXREVERB_MIN_REFLECTIONS_DELAY       : constant Float := 0.0;
  AL_EAXREVERB_MAX_REFLECTIONS_DELAY       : constant Float := 0.3;
  AL_EAXREVERB_DEFAULT_REFLECTIONS_DELAY   : constant Float := 0.007;

  AL_EAXREVERB_DEFAULT_REFLECTIONS_PAN_XYZ : constant Float := 0.0;

  AL_EAXREVERB_MIN_LATE_REVERB_GAIN        : constant Float := 0.0;
  AL_EAXREVERB_MAX_LATE_REVERB_GAIN        : constant Float := 10.0;
  AL_EAXREVERB_DEFAULT_LATE_REVERB_GAIN    : constant Float := 1.26;

  AL_EAXREVERB_MIN_LATE_REVERB_DELAY       : constant Float := 0.0;
  AL_EAXREVERB_MAX_LATE_REVERB_DELAY       : constant Float := 0.1;
  AL_EAXREVERB_DEFAULT_LATE_REVERB_DELAY   : constant Float := 0.011;

  AL_EAXREVERB_DEFAULT_LATE_REVERB_PAN_XYZ : constant Float := 0.0;

  AL_EAXREVERB_MIN_ECHO_TIME               : constant Float := 0.075;
  AL_EAXREVERB_MAX_ECHO_TIME               : constant Float := 0.25;
  AL_EAXREVERB_DEFAULT_ECHO_TIME           : constant Float := 0.25;

  AL_EAXREVERB_MIN_ECHO_DEPTH              : constant Float := 0.0;
  AL_EAXREVERB_MAX_ECHO_DEPTH              : constant Float := 1.0;
  AL_EAXREVERB_DEFAULT_ECHO_DEPTH          : constant Float := 0.0;

  AL_EAXREVERB_MIN_MODULATION_TIME         : constant Float := 0.04;
  AL_EAXREVERB_MAX_MODULATION_TIME         : constant Float := 4.0;
  AL_EAXREVERB_DEFAULT_MODULATION_TIME     : constant Float := 0.25;

  AL_EAXREVERB_MIN_MODULATION_DEPTH        : constant Float := 0.0;
  AL_EAXREVERB_MAX_MODULATION_DEPTH        : constant Float := 1.0;
  AL_EAXREVERB_DEFAULT_MODULATION_DEPTH    : constant Float := 0.0;

  AL_EAXREVERB_MIN_AIR_ABSORPTION_GAINHF   : constant Float := 0.892;
  AL_EAXREVERB_MAX_AIR_ABSORPTION_GAINHF   : constant Float := 1.0;
  AL_EAXREVERB_DEFAULT_AIR_ABSORPTION_GAINHF : constant Float := 0.994;

  AL_EAXREVERB_MIN_HFREFERENCE             : constant Float := 1000.0;
  AL_EAXREVERB_MAX_HFREFERENCE             : constant Float := 20000.0;
  AL_EAXREVERB_DEFAULT_HFREFERENCE         : constant Float := 5000.0;

  AL_EAXREVERB_MIN_LFREFERENCE             : constant Float := 20.0;
  AL_EAXREVERB_MAX_LFREFERENCE             : constant Float := 1000.0;
  AL_EAXREVERB_DEFAULT_LFREFERENCE         : constant Float := 250.0;

  AL_EAXREVERB_MIN_ROOM_ROLLOFF_FACTOR     : constant Float := 0.0;
  AL_EAXREVERB_MAX_ROOM_ROLLOFF_FACTOR     : constant Float := 10.0;
  AL_EAXREVERB_DEFAULT_ROOM_ROLLOFF_FACTOR : constant Float := 0.0;

  AL_EAXREVERB_MIN_DECAY_HFLIMIT           : constant AL.Bool := AL.AL_FALSE;
  AL_EAXREVERB_MAX_DECAY_HFLIMIT           : constant AL.Bool := AL.AL_TRUE;
  AL_EAXREVERB_DEFAULT_DECAY_HFLIMIT       : constant AL.Bool := AL.AL_TRUE;

  -- Chorus effect
  AL_CHORUS_WAVEFORM_SINUSOID              : constant AL.Enum := 0;
  AL_CHORUS_WAVEFORM_TRIANGLE              : constant AL.Enum := 1;

  AL_CHORUS_MIN_WAVEFORM                   : constant AL.Enum := 0;
  AL_CHORUS_MAX_WAVEFORM                   : constant AL.Enum := 1;
  AL_CHORUS_DEFAULT_WAVEFORM               : constant AL.Enum := 1;

  AL_CHORUS_MIN_PHASE                      : constant AL.Enum := -180;
  AL_CHORUS_MAX_PHASE                      : constant AL.Enum := 180;
  AL_CHORUS_DEFAULT_PHASE                  : constant AL.Enum := 90;

  AL_CHORUS_MIN_RATE                       : constant Float := 0.0;
  AL_CHORUS_MAX_RATE                       : constant Float := 10.0;
  AL_CHORUS_DEFAULT_RATE                   : constant Float := 1.1;

  AL_CHORUS_MIN_DEPTH                      : constant Float := 0.0;
  AL_CHORUS_MAX_DEPTH                      : constant Float := 1.0;
  AL_CHORUS_DEFAULT_DEPTH                  : constant Float := 0.1;

  AL_CHORUS_MIN_FEEDBACK                   : constant Float := -1.0;
  AL_CHORUS_MAX_FEEDBACK                   : constant Float := 1.0;
  AL_CHORUS_DEFAULT_FEEDBACK               : constant Float := 0.25;

  AL_CHORUS_MIN_DELAY                      : constant Float := 0.0;
  AL_CHORUS_MAX_DELAY                      : constant Float := 0.016;
  AL_CHORUS_DEFAULT_DELAY                  : constant Float := 0.016;

  -- Distortion effect
  AL_DISTORTION_MIN_EDGE                   : constant Float := 0.0;
  AL_DISTORTION_MAX_EDGE                   : constant Float := 1.0;
  AL_DISTORTION_DEFAULT_EDGE               : constant Float := 0.2;

  AL_DISTORTION_MIN_GAIN                   : constant Float := 0.01;
  AL_DISTORTION_MAX_GAIN                   : constant Float := 1.0;
  AL_DISTORTION_DEFAULT_GAIN               : constant Float := 0.05;

  AL_DISTORTION_MIN_LOWPASS_CUTOFF         : constant Float := 80.0;
  AL_DISTORTION_MAX_LOWPASS_CUTOFF         : constant Float := 24000.0;
  AL_DISTORTION_DEFAULT_LOWPASS_CUTOFF     : constant Float := 8000.0;

  AL_DISTORTION_MIN_EQCENTER               : constant Float := 80.0;
  AL_DISTORTION_MAX_EQCENTER               : constant Float := 24000.0;
  AL_DISTORTION_DEFAULT_EQCENTER           : constant Float := 3600.0;

  AL_DISTORTION_MIN_EQBANDWIDTH            : constant Float := 80.0;
  AL_DISTORTION_MAX_EQBANDWIDTH            : constant Float := 24000.0;
  AL_DISTORTION_DEFAULT_EQBANDWIDTH        : constant Float := 3600.0;

  -- Echo effect
  AL_ECHO_MIN_DELAY                        : constant Float := 0.0;
  AL_ECHO_MAX_DELAY                        : constant Float := 0.207;
  AL_ECHO_DEFAULT_DELAY                    : constant Float := 0.1;

  AL_ECHO_MIN_LRDELAY                      : constant Float := 0.0;
  AL_ECHO_MAX_LRDELAY                      : constant Float := 0.404;
  AL_ECHO_DEFAULT_LRDELAY                  : constant Float := 0.1;

  AL_ECHO_MIN_DAMPING                      : constant Float := 0.0;
  AL_ECHO_MAX_DAMPING                      : constant Float := 0.99;
  AL_ECHO_DEFAULT_DAMPING                  : constant Float := 0.5;

  AL_ECHO_MIN_FEEDBACK                     : constant Float := 0.0;
  AL_ECHO_MAX_FEEDBACK                     : constant Float := 1.0;
  AL_ECHO_DEFAULT_FEEDBACK                 : constant Float := 0.5;

  AL_ECHO_MIN_SPREAD                       : constant Float := -1.0;
  AL_ECHO_MAX_SPREAD                       : constant Float := 1.0;
  AL_ECHO_DEFAULT_SPREAD                   : constant Float := -1.0;

  -- Flanger effect
  AL_FLANGER_WAVEFORM_SINUSOID             : constant AL.Enum := 0;
  AL_FLANGER_WAVEFORM_TRIANGLE             : constant AL.Enum := 1;

  AL_FLANGER_MIN_WAVEFORM                  : constant AL.Enum := 0;
  AL_FLANGER_MAX_WAVEFORM                  : constant AL.Enum := 1;
  AL_FLANGER_DEFAULT_WAVEFORM              : constant AL.Enum := 1;

  AL_FLANGER_MIN_PHASE                     : constant AL.Enum := -180;
  AL_FLANGER_MAX_PHASE                     : constant AL.Enum := 180;
  AL_FLANGER_DEFAULT_PHASE                 : constant AL.Enum := 0;

  AL_FLANGER_MIN_RATE                      : constant Float := 0.0;
  AL_FLANGER_MAX_RATE                      : constant Float := 10.0;
  AL_FLANGER_DEFAULT_RATE                  : constant Float := 0.27;

  AL_FLANGER_MIN_DEPTH                     : constant Float := 0.0;
  AL_FLANGER_MAX_DEPTH                     : constant Float := 1.0;
  AL_FLANGER_DEFAULT_DEPTH                 : constant Float := 1.0;

  AL_FLANGER_MIN_FEEDBACK                  : constant Float := -1.0;
  AL_FLANGER_MAX_FEEDBACK                  : constant Float := 1.0;
  AL_FLANGER_DEFAULT_FEEDBACK              : constant Float := -0.5;

  AL_FLANGER_MIN_DELAY                     : constant Float := 0.0;
  AL_FLANGER_MAX_DELAY                     : constant Float := 0.004;
  AL_FLANGER_DEFAULT_DELAY                 : constant Float := 0.002;

  -- Frequency shifter effect
  AL_FREQUENCY_SHIFTER_MIN_FREQUENCY       : constant Float := 0.0;
  AL_FREQUENCY_SHIFTER_MAX_FREQUENCY       : constant Float := 24000.0;
  AL_FREQUENCY_SHIFTER_DEFAULT_FREQUENCY   : constant Float := 0.0;

  AL_FREQUENCY_SHIFTER_MIN_LEFT_DIRECTION  : constant AL.Enum := 0;
  AL_FREQUENCY_SHIFTER_MAX_LEFT_DIRECTION  : constant AL.Enum := 2;
  AL_FREQUENCY_SHIFTER_DEFAULT_LEFT_DIRECTION : constant AL.Enum := 0;

  AL_FREQUENCY_SHIFTER_DIRECTION_DOWN      : constant AL.Enum := 0;
  AL_FREQUENCY_SHIFTER_DIRECTION_UP        : constant AL.Enum := 1;
  AL_FREQUENCY_SHIFTER_DIRECTION_OFF       : constant AL.Enum := 2;

  AL_FREQUENCY_SHIFTER_MIN_RIGHT_DIRECTION : constant AL.Enum := 0;
  AL_FREQUENCY_SHIFTER_MAX_RIGHT_DIRECTION : constant AL.Enum := 2;
  AL_FREQUENCY_SHIFTER_DEFAULT_RIGHT_DIRECTION : constant AL.Enum := 0;

  -- Vocal morpher effect
  AL_VOCAL_MORPHER_MIN_PHONEMEA            : constant AL.Enum := 0;
  AL_VOCAL_MORPHER_MAX_PHONEMEA            : constant AL.Enum := 29;
  AL_VOCAL_MORPHER_DEFAULT_PHONEMEA        : constant AL.Enum := 0;

  AL_VOCAL_MORPHER_MIN_PHONEMEA_COARSE_TUNING : constant AL.Enum := -24;
  AL_VOCAL_MORPHER_MAX_PHONEMEA_COARSE_TUNING : constant AL.Enum := 24;
  AL_VOCAL_MORPHER_DEFAULT_PHONEMEA_COARSE_TUNING : constant AL.Enum := 0;

  AL_VOCAL_MORPHER_MIN_PHONEMEB            : constant AL.Enum := 0;
  AL_VOCAL_MORPHER_MAX_PHONEMEB            : constant AL.Enum := 29;
  AL_VOCAL_MORPHER_DEFAULT_PHONEMEB        : constant AL.Enum := 10;

  AL_VOCAL_MORPHER_MIN_PHONEMEB_COARSE_TUNING : constant AL.Enum := -24;
  AL_VOCAL_MORPHER_MAX_PHONEMEB_COARSE_TUNING : constant AL.Enum := 24;
  AL_VOCAL_MORPHER_DEFAULT_PHONEMEB_COARSE_TUNING : constant AL.Enum := 0;

  AL_VOCAL_MORPHER_PHONEME_A               : constant AL.Enum := 0;
  AL_VOCAL_MORPHER_PHONEME_E               : constant AL.Enum := 1;
  AL_VOCAL_MORPHER_PHONEME_I               : constant AL.Enum := 2;
  AL_VOCAL_MORPHER_PHONEME_O               : constant AL.Enum := 3;
  AL_VOCAL_MORPHER_PHONEME_U               : constant AL.Enum := 4;
  AL_VOCAL_MORPHER_PHONEME_AA              : constant AL.Enum := 5;
  AL_VOCAL_MORPHER_PHONEME_AE              : constant AL.Enum := 6;
  AL_VOCAL_MORPHER_PHONEME_AH              : constant AL.Enum := 7;
  AL_VOCAL_MORPHER_PHONEME_AO              : constant AL.Enum := 8;
  AL_VOCAL_MORPHER_PHONEME_EH              : constant AL.Enum := 9;
  AL_VOCAL_MORPHER_PHONEME_ER              : constant AL.Enum := 10;
  AL_VOCAL_MORPHER_PHONEME_IH              : constant AL.Enum := 11;
  AL_VOCAL_MORPHER_PHONEME_IY              : constant AL.Enum := 12;
  AL_VOCAL_MORPHER_PHONEME_UH              : constant AL.Enum := 13;
  AL_VOCAL_MORPHER_PHONEME_UW              : constant AL.Enum := 14;
  AL_VOCAL_MORPHER_PHONEME_B               : constant AL.Enum := 15;
  AL_VOCAL_MORPHER_PHONEME_D               : constant AL.Enum := 16;
  AL_VOCAL_MORPHER_PHONEME_F               : constant AL.Enum := 17;
  AL_VOCAL_MORPHER_PHONEME_G               : constant AL.Enum := 18;
  AL_VOCAL_MORPHER_PHONEME_J               : constant AL.Enum := 19;
  AL_VOCAL_MORPHER_PHONEME_K               : constant AL.Enum := 20;
  AL_VOCAL_MORPHER_PHONEME_L               : constant AL.Enum := 21;
  AL_VOCAL_MORPHER_PHONEME_M               : constant AL.Enum := 22;
  AL_VOCAL_MORPHER_PHONEME_N               : constant AL.Enum := 23;
  AL_VOCAL_MORPHER_PHONEME_P               : constant AL.Enum := 24;
  AL_VOCAL_MORPHER_PHONEME_R               : constant AL.Enum := 25;
  AL_VOCAL_MORPHER_PHONEME_S               : constant AL.Enum := 26;
  AL_VOCAL_MORPHER_PHONEME_T               : constant AL.Enum := 27;
  AL_VOCAL_MORPHER_PHONEME_V               : constant AL.Enum := 28;
  AL_VOCAL_MORPHER_PHONEME_Z               : constant AL.Enum := 29;

  AL_VOCAL_MORPHER_WAVEFORM_SINUSOID       : constant AL.Enum := 0;
  AL_VOCAL_MORPHER_WAVEFORM_TRIANGLE       : constant AL.Enum := 1;
  AL_VOCAL_MORPHER_WAVEFORM_SAWTOOTH       : constant AL.Enum := 2;

  AL_VOCAL_MORPHER_MIN_WAVEFORM            : constant AL.Enum := 0;
  AL_VOCAL_MORPHER_MAX_WAVEFORM            : constant AL.Enum := 2;
  AL_VOCAL_MORPHER_DEFAULT_WAVEFORM        : constant AL.Enum := 0;

  AL_VOCAL_MORPHER_MIN_RATE                : constant Float := 0.0;
  AL_VOCAL_MORPHER_MAX_RATE                : constant Float := 10.0;
  AL_VOCAL_MORPHER_DEFAULT_RATE            : constant Float := 1.41;

  -- Pitch shifter effect
  AL_PITCH_SHIFTER_MIN_COARSE_TUNE         : constant AL.Enum := -12;
  AL_PITCH_SHIFTER_MAX_COARSE_TUNE         : constant AL.Enum := 12;
  AL_PITCH_SHIFTER_DEFAULT_COARSE_TUNE     : constant AL.Enum := 12;

  AL_PITCH_SHIFTER_MIN_FINE_TUNE           : constant AL.Enum := -50;
  AL_PITCH_SHIFTER_MAX_FINE_TUNE           : constant AL.Enum := 50;
  AL_PITCH_SHIFTER_DEFAULT_FINE_TUNE       : constant AL.Enum := 0;

  -- Ring modulator effect
  AL_RING_MODULATOR_MIN_FREQUENCY          : constant Float := 0.0;
  AL_RING_MODULATOR_MAX_FREQUENCY          : constant Float := 8000.0;
  AL_RING_MODULATOR_DEFAULT_FREQUENCY      : constant Float := 440.0;

  AL_RING_MODULATOR_MIN_HIGHPASS_CUTOFF    : constant Float := 0.0;
  AL_RING_MODULATOR_MAX_HIGHPASS_CUTOFF    : constant Float := 24000.0;
  AL_RING_MODULATOR_DEFAULT_HIGHPASS_CUTOFF : constant Float := 800.0;

  AL_RING_MODULATOR_SINUSOID               : constant AL.Enum := 0;
  AL_RING_MODULATOR_SAWTOOTH               : constant AL.Enum := 1;
  AL_RING_MODULATOR_SQUARE                 : constant AL.Enum := 2;

  AL_RING_MODULATOR_MIN_WAVEFORM           : constant AL.Enum := 0;
  AL_RING_MODULATOR_MAX_WAVEFORM           : constant AL.Enum := 2;
  AL_RING_MODULATOR_DEFAULT_WAVEFORM       : constant AL.Enum := 0;

  -- Autowah effect
  AL_AUTOWAH_MIN_ATTACK_TIME               : constant Float := 0.0001;
  AL_AUTOWAH_MAX_ATTACK_TIME               : constant Float := 1.0;
  AL_AUTOWAH_DEFAULT_ATTACK_TIME           : constant Float := 0.06;

  AL_AUTOWAH_MIN_RELEASE_TIME              : constant Float := 0.0001;
  AL_AUTOWAH_MAX_RELEASE_TIME              : constant Float := 1.0;
  AL_AUTOWAH_DEFAULT_RELEASE_TIME          : constant Float := 0.06;

  AL_AUTOWAH_MIN_RESONANCE                 : constant Float := 2.0;
  AL_AUTOWAH_MAX_RESONANCE                 : constant Float := 1000.0;
  AL_AUTOWAH_DEFAULT_RESONANCE             : constant Float := 1000.0;

  AL_AUTOWAH_MIN_PEAK_GAIN                 : constant Float := 0.00003;
  AL_AUTOWAH_MAX_PEAK_GAIN                 : constant Float := 31621.0;
  AL_AUTOWAH_DEFAULT_PEAK_GAIN             : constant Float := 11.22;

  -- Compressor effect
  AL_COMPRESSOR_MIN_ONOFF                  : constant AL.Enum := 0;
  AL_COMPRESSOR_MAX_ONOFF                  : constant AL.Enum := 1;
  AL_COMPRESSOR_DEFAULT_ONOFF              : constant AL.Enum := 1;

  -- Equalizer effect
  AL_EQUALIZER_MIN_LOW_GAIN                : constant Float := 0.126;
  AL_EQUALIZER_MAX_LOW_GAIN                : constant Float := 7.943;
  AL_EQUALIZER_DEFAULT_LOW_GAIN            : constant Float := 1.0;

  AL_EQUALIZER_MIN_LOW_CUTOFF              : constant Float := 50.0;
  AL_EQUALIZER_MAX_LOW_CUTOFF              : constant Float := 800.0;
  AL_EQUALIZER_DEFAULT_LOW_CUTOFF          : constant Float := 200.0;

  AL_EQUALIZER_MIN_MID1_GAIN               : constant Float := 0.126;
  AL_EQUALIZER_MAX_MID1_GAIN               : constant Float := 7.943;
  AL_EQUALIZER_DEFAULT_MID1_GAIN           : constant Float := 1.0;

  AL_EQUALIZER_MIN_MID1_CENTER             : constant Float := 200.0;
  AL_EQUALIZER_MAX_MID1_CENTER             : constant Float := 3000.0;
  AL_EQUALIZER_DEFAULT_MID1_CENTER         : constant Float := 500.0;

  AL_EQUALIZER_MIN_MID1_WIDTH              : constant Float := 0.01;
  AL_EQUALIZER_MAX_MID1_WIDTH              : constant Float := 1.0;
  AL_EQUALIZER_DEFAULT_MID1_WIDTH          : constant Float := 1.0;

  AL_EQUALIZER_MIN_MID2_GAIN               : constant Float := 0.126;
  AL_EQUALIZER_MAX_MID2_GAIN               : constant Float := 7.943;
  AL_EQUALIZER_DEFAULT_MID2_GAIN           : constant Float := 1.0;

  AL_EQUALIZER_MIN_MID2_CENTER             : constant Float := 1000.0;
  AL_EQUALIZER_MAX_MID2_CENTER             : constant Float := 8000.0;
  AL_EQUALIZER_DEFAULT_MID2_CENTER         : constant Float := 3000.0;

  AL_EQUALIZER_MIN_MID2_WIDTH              : constant Float := 0.01;
  AL_EQUALIZER_MAX_MID2_WIDTH              : constant Float := 1.0;
  AL_EQUALIZER_DEFAULT_MID2_WIDTH          : constant Float := 1.0;

  AL_EQUALIZER_MIN_HIGH_GAIN               : constant Float := 0.126;
  AL_EQUALIZER_MAX_HIGH_GAIN               : constant Float := 7.943;
  AL_EQUALIZER_DEFAULT_HIGH_GAIN           : constant Float := 1.0;

  AL_EQUALIZER_MIN_HIGH_CUTOFF             : constant Float := 4000.0;
  AL_EQUALIZER_MAX_HIGH_CUTOFF             : constant Float := 16000.0;
  AL_EQUALIZER_DEFAULT_HIGH_CUTOFF         : constant Float := 6000.0;

  -- Source parameter value ranges and defaults.
  AL_MIN_AIR_ABSORPTION_FACTOR             : constant Float := 0.0;
  AL_MAX_AIR_ABSORPTION_FACTOR             : constant Float := 10.0;
  AL_DEFAULT_AIR_ABSORPTION_FACTOR         : constant Float := 0.0;

  AL_MIN_ROOM_ROLLOFF_FACTOR               : constant Float := 0.0;
  AL_MAX_ROOM_ROLLOFF_FACTOR               : constant Float := 10.0;
  AL_DEFAULT_ROOM_ROLLOFF_FACTOR           : constant Float := 0.0;

  AL_MIN_CONE_OUTER_GAINHF                 : constant Float := 0.0;
  AL_MAX_CONE_OUTER_GAINHF                 : constant Float := 1.0;
  AL_DEFAULT_CONE_OUTER_GAINHF             : constant Float := 1.0;

  AL_MIN_DIRECT_FILTER_GAINHF_AUTO         : constant AL.Bool := AL.AL_FALSE;
  AL_MAX_DIRECT_FILTER_GAINHF_AUTO         : constant AL.Bool := AL.AL_TRUE;
  AL_DEFAULT_DIRECT_FILTER_GAINHF_AUTO     : constant AL.Bool := AL.AL_TRUE;

  AL_MIN_AUXILIARY_SEND_FILTER_GAIN_AUTO   : constant AL.Bool := AL.AL_FALSE;
  AL_MAX_AUXILIARY_SEND_FILTER_GAIN_AUTO   : constant AL.Bool := AL.AL_TRUE;
  AL_DEFAULT_AUXILIARY_SEND_FILTER_GAIN_AUTO : constant AL.Bool := AL.AL_TRUE;

  AL_MIN_AUXILIARY_SEND_FILTER_GAINHF_AUTO : constant AL.Bool := AL.AL_FALSE;
  AL_MAX_AUXILIARY_SEND_FILTER_GAINHF_AUTO : constant AL.Bool := AL.AL_TRUE;
  AL_DEFAULT_AUXILIARY_SEND_FILTER_GAINHF_AUTO : constant AL.Bool := AL.AL_TRUE;


  -- Listener parameter value ranges and defaults.
  -- AL_MIN_METERS_PER_UNIT value is taken from mysql/my_global.h:FLT_MIN
  AL_MIN_METERS_PER_UNIT           : constant Float := 1.40129846432481707e-45;
  AL_MAX_METERS_PER_UNIT                   : constant Float := Float'Last;
  AL_DEFAULT_METERS_PER_UNIT               : constant Float := 1.0;

  ---------------------------------------------------------------------------

                        ---------------------------
                        -- S U B P R O G R A M S --
                        ---------------------------

  ---------------------------------------------------------------------------

  procedure Gen_Effects (N: in AL.SizeI; Effects: in AL.Pointer);
  Pragma Import (StdCall, Gen_Effects, "alGenEffects");

  procedure Delete_Effects (N: in AL.SizeI; Effects: in AL.Pointer);
  Pragma Import (StdCall, Delete_Effects, "alDeleteEffects");

  function Is_Effect (Effect: in AL.UInt) return AL.Bool;
  Pragma Import (StdCall, Is_Effect, "alIsEffect");

  procedure Effect (Effect: in AL.UInt; Param: in AL.Enum; Value: in AL.Int);

  procedure Effect (Effect: in AL.UInt; Param: in AL.Enum; Value: in Float);
  Pragma Inline (Effect);

  procedure Effect_IV
    ( Effect: in AL.UInt;
      Param : in AL.Enum;
      Values: in AL.Pointer
    );
  Pragma Import (StdCall, Effect_IV, "alEffectiv");

  procedure Effect_FV
    ( Effect: in AL.UInt;
      Param : in AL.Enum;
      Values: in AL.Pointer
    );
  Pragma Import (StdCall, Effect_FV, "alEffectfv");

  procedure Get_Effect_I
    ( Effect: in AL.UInt;
      Param : in AL.Enum;
      Value : in AL.Pointer
    );
  Pragma Import (StdCall, Get_Effect_I, "alGetEffecti");

  procedure Get_Effect_IV
    ( Effect: in AL.UInt;
      Param : in AL.Enum;
      Values: in AL.Pointer
    );
  Pragma Import (StdCall, Get_Effect_IV, "alGetEffectiv");

  procedure Get_Effect_F
    ( Effect: in AL.UInt;
      Param : in AL.Enum;
      Value : in AL.Pointer
    );
  Pragma Import (StdCall, Get_Effect_F, "alGetEffectf");

  procedure Get_Effect_FV
    ( Effect: in AL.UInt;
      Param : in AL.Enum;
      Values: in AL.Pointer
    );
  Pragma Import (StdCall, Get_Effect_FV, "alGetEffectfv");

  procedure Gen_Filters (N: in AL.SizeI; Filters: in AL.UInt);
  Pragma Import (StdCall, Gen_Filters, "alGenFilters");

  procedure Delete_Filters (N: in AL.SizeI; Filters: in AL.Pointer);
  Pragma Import (StdCall, Delete_Filters, "alDeleteFilters");

  function Is_Filter (Filter: in AL.UInt) return AL.Bool;
  Pragma Import (StdCall, Is_Filter, "alIsFilter");

  procedure Filter (Filter: in AL.UInt; Param: in AL.Enum; Value: in AL.Int);

  procedure Filter (Filter: in AL.UInt; Param: in AL.Enum; Value: in Float);
  Pragma Inline (Filter);

  procedure Filter_IV
    ( Filter: in AL.UInt;
      Param : in AL.Enum;
      Values: in AL.Pointer
    );
  Pragma Import (StdCall, Filter_IV, "alFilteriv");

  procedure Filter_FV
    ( Filter: in AL.UInt;
      Param : in AL.Enum;
      Values: in AL.Pointer
    );
  Pragma Import (StdCall, Filter_FV, "alFilterfv");

  procedure Get_Filter_I
    ( Filter: in AL.UInt;
      Param : in AL.Enum;
      Value : in AL.Pointer
    );
  Pragma Import (StdCall, Get_Filter_I, "alGetFilteri");

  procedure Get_Filter_IV
    ( Filter: in AL.UInt;
      Param : in AL.Enum;
      Values: in AL.Int
    );
  Pragma Import (StdCall, Get_Filter_IV, "alGetFilteriv");

  procedure Get_Filter_F
    ( Filter: in AL.UInt;
      Param : in AL.Enum;
      Values: in AL.Pointer
    );
  Pragma Import (StdCall, Get_Filter_F, "alGetFilterf");

  procedure Get_Filter_FV
    ( Filter: in AL.UInt;
      Param : in AL.Enum;
      Values: in AL.Pointer
    );
  Pragma Import (StdCall, Get_Filter_FV, "alGetFilterfv");

  procedure Gen_Auxiliary_Effect_Slot
    ( N           : in AL.SizeI;
      Effect_Slots: in AL.Pointer
    );
  Pragma Import
    ( StdCall, Gen_Auxiliary_Effect_Slot, "alGenAuxiliaryEffectSlots" );

  procedure Delete_Auxiliary_Effect_Slots
    ( N           : in AL.SizeI;
      Effect_Slots: in AL.Pointer
    );
  Pragma Import
    ( StdCall, Delete_Auxiliary_Effect_Slots, "alDeleteAuxiliaryEffectSlots" );

  function Is_Auxiliary_Effect_Slot (Effect_Slot: in AL.UInt) return AL.Bool;
  Pragma Import (StdCall, Is_Auxiliary_Effect_Slot, "alIsAuxiliaryEffectSlot");

  procedure Auxiliary_Effect_Slot (Effect_Slot: in AL.UInt; Param: in AL.Enum; Value: in AL.Int);
  procedure Auxiliary_Effect_Slot (Effect_Slot: in AL.UInt; Param: in AL.Enum; Value: in Float);
--AL_API ALvoid AL_APIENTRY alAuxiliaryEffectSloti(ALuint effectslot, ALenum param, ALint iValue);
--AL_API ALvoid AL_APIENTRY alAuxiliaryEffectSlotf(ALuint effectslot, ALenum param, ALfloat flValue);

  procedure Auxiliary_Effect_Slot_IV
    ( Effect_Slot : in AL.UInt;
      Param       : in AL.Enum;
      Values      : in AL.Pointer
    );
  Pragma Import (StdCall, Auxiliary_Effect_Slot_IV, "alAuxiliaryEffectSlotiv");

  procedure Auxiliary_Effect_Slot_FV
    ( Effect_Slot : in AL.UInt;
      Param       : in AL.Enum;
      Values      : in AL.Pointer
    );
  Pragma Import (StdCall, Auxiliary_Effect_Slot_FV, "alAuxiliaryEffectSlotfv");

  procedure Get_Auxiliary_Effects_Slot_I
    ( Effect_Slot : in AL.UInt;
      Param       : in AL.Enum;
      Value       : in AL.Pointer
    );
  Pragma Import
    ( StdCall, Get_Auxiliary_Effects_Slot_I, "alGetAuxiliaryEffectSloti" );

  procedure Get_Auxiliary_Effect_Slot_IV
    ( Effect_Slot : in AL.UInt;
      Param       : in AL.Enum;
      Values      : in AL.Pointer
    );
  Pragma Import
    ( StdCall, Get_Auxiliary_Effect_Slot_IV, "alGetAuxiliaryEffectSlotiv" );

  procedure Get_Auxiliary_Effect_Slot_F
    ( Effect_Slot : in AL.UInt;
      Param       : in AL.Enum;
      Value       : in AL.Pointer
    );
  Pragma Import
    ( StdCall, Get_Auxiliary_Effect_Slot_F, "alGetAuxiliaryEffectSlotf" );

  procedure Get_Auxiliary_Effect_Slot_FV
    ( Effect_Slot : in AL.UInt;
      Param       : in AL.Enum;
      Values      : in AL.Pointer
    );
  Pragma Import
    ( StdCall, Get_Auxiliary_Effect_Slot_FV, "alGetAuxiliaryEffectSlotfv" );

  ---------------------------------------------------------------------------

end Oto.EFX;
