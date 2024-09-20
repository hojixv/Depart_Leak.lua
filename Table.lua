getgenv().Depart = {
    ['Intro'] = {
        ['Activated'] = true,
        ['Mode'] = "1"
    },
    ['Binding'] = {
        ['Aimbot'] = 'C',
        ['Resolver'] = 'G',
        ['Macro'] = 'X',
        ['TriggerBot'] = 'T'
    },
    ['Macro'] = {
        ['Activated'] = true,
        ['Mode'] = "kb",
        ['Speed'] = 0.01
    },
    ['Fighting'] = {
        ['SilentAim'] = {
            ['Activated'] = true,
            ['Prediction'] = 0.1243,
            ['MultipleParts'] = {"HumanoidRootPart", "Head", "Torso"},
            ['Anti_Groundshots'] = true,
            ['Anti_Curve'] = true,
            ['MaxAngle'] = 60,
            ['DottedFov'] = {
                ['FovRadius'] = 200,
                ['DotSize'] = 1,
                ['Activated'] = true,
                ['Visible'] = true,
                ['RGB'] = false,
                ['Color'] = Color3.fromRGB(255, 165, 0),
                ['NumberOfDots'] = 100,
                ['Thickness'] = 0.9,
                ['Filled'] = false
            }
        },
        ['AimAssist'] = {
            ['ActivateAimbot'] = true,
            ['TargetParts'] = 'HumanoidRootPart',
            ['Prediction'] = 0.014556,
            ['CameraSmoothness'] = 0.067889
        },
        ['AimbotAirSection'] = {
            ['ActivateAirBornePrediction'] = true,
            ['AirBorneParts'] = 'Head',
            ['AirBorneSmoothness'] = 0.078856,
            ['AirShotPrediction'] = 0.1255
        },
        ['AimPointMultipleHitParts'] = {
            ['Activated'] = true,
            ['Multi'] = {'Head', 'HumanoidRootPart', 'UpperTorso', 'LowerTorso'}
        },
        ['AimPoint'] = {
            ['Activated'] = false,
            ['Prediction'] = 0.12445,
            ['Parts'] = 'HumanoidRootPart',
            ['AirBorneParts'] = 'Head'
        },
        ['Offsets'] = {
            ['Jump'] = {0.12},
            ['Fall'] = {-0.12}
        }
    },
['TriggerBot'] = {
    ['Mode'] = "Toggle", --// Hold is the other option
    ['Activated'] = true,
    ['Prediction'] = 0.1255,
    ['UseDelay'] = true,
    ['Delay'] = 0.001,
    ['NearestPart'] = true,
    ['WhitelistedGun'] = {
        '[Revolver]',
        '[Double-Barrel SG]',
        '[TacticalShotgun]',
        '[Shotgun]',
        '[Glock Silencer]',
        '[DoubleBarrel]'
    }
},
    ['Miscellaneous'] = {
        ['Resolver'] = {
            ['Activated'] = true,
            ['Notification'] = true
        },
        ['PredictionAdjuster'] = {
            ['EnableAdjuster'] = true,
            ['VelocityThreshold'] = 100
        },
        ['Checks'] = {
            ['WallCheck'] = false
        }
    }
}
