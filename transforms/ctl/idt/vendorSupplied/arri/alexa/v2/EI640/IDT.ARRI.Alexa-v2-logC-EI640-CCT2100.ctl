
// <ACEStransformID>urn:ampas:aces:transformId:v1.5:IDT.ARRI.Alexa-v2-logC-EI640-CCT2100.a1.v1</ACEStransformID>
// <ACESuserName>ACES 1.0 Input - ARRI V2 LogC (EI640, 2100K)</ACESuserName>

// ARRI ALEXA IDT for ALEXA logC files
//  with camera EI set to 640
//  and CCT of adopted white set to 2100K
// Written by v2_IDT_maker.py v0.05 on Friday 19 December 2014

float
normalizedLogC2ToRelativeExposure(float x) {
	if (x > 0.128130)
		return (pow(10,(x - 0.391007) / 0.250218) - 0.089004) / 5.061087;
	else
		return (x - 0.128130) / 5.198031;
}

void main
(	input varying float rIn,
	input varying float gIn,
	input varying float bIn,
	input varying float aIn,
	output varying float rOut,
	output varying float gOut,
	output varying float bOut,
	output varying float aOut)
{

	float r_lin = normalizedLogC2ToRelativeExposure(rIn);
	float g_lin = normalizedLogC2ToRelativeExposure(gIn);
	float b_lin = normalizedLogC2ToRelativeExposure(bIn);

	rOut = r_lin * 0.792200 + g_lin * 0.048665 + b_lin * 0.159136;
	gOut = r_lin * -0.010492 + g_lin * 1.066360 + b_lin * -0.055868;
	bOut = r_lin * 0.016825 + g_lin * -0.382243 + b_lin * 1.365418;
	aOut = 1.0;

}
