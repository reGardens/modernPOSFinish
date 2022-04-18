<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInitad1866109e10b4b6658880477167ee83
{
    public static $prefixLengthsPsr4 = array (
        'S' => 
        array (
            'SMSGateway\\Gateway\\' => 19,
        ),
    );

    public static $prefixDirsPsr4 = array (
        'SMSGateway\\Gateway\\' => 
        array (
            0 => __DIR__ . '/../..' . '/_inc/gateway',
        ),
    );

    public static $classMap = array (
        'SMSGateway\\BaseController' => __DIR__ . '/../..' . '/_inc/BaseController.php',
        'SMSGateway\\Gateway\\Clickatell' => __DIR__ . '/../..' . '/_inc/gateway/Clickatell.php',
        'SMSGateway\\Gateway\\Conference' => __DIR__ . '/../..' . '/_inc/gateway/Twilio.php',
        'SMSGateway\\Gateway\\Dial' => __DIR__ . '/../..' . '/_inc/gateway/Twilio.php',
        'SMSGateway\\Gateway\\GatewayInterface' => __DIR__ . '/../..' . '/_inc/gateway/GatewayInterface.php',
        'SMSGateway\\Gateway\\Gather' => __DIR__ . '/../..' . '/_inc/gateway/Twilio.php',
        'SMSGateway\\Gateway\\Hangup' => __DIR__ . '/../..' . '/_inc/gateway/Twilio.php',
        'SMSGateway\\Gateway\\Msg91' => __DIR__ . '/../..' . '/_inc/gateway/Msg91.php',
        'SMSGateway\\Gateway\\Number' => __DIR__ . '/../..' . '/_inc/gateway/Twilio.php',
        'SMSGateway\\Gateway\\Pause' => __DIR__ . '/../..' . '/_inc/gateway/Twilio.php',
        'SMSGateway\\Gateway\\Play' => __DIR__ . '/../..' . '/_inc/gateway/Twilio.php',
        'SMSGateway\\Gateway\\Record' => __DIR__ . '/../..' . '/_inc/gateway/Twilio.php',
        'SMSGateway\\Gateway\\Redirect' => __DIR__ . '/../..' . '/_inc/gateway/Twilio.php',
        'SMSGateway\\Gateway\\Reject' => __DIR__ . '/../..' . '/_inc/gateway/Twilio.php',
        'SMSGateway\\Gateway\\Response' => __DIR__ . '/../..' . '/_inc/gateway/Twilio.php',
        'SMSGateway\\Gateway\\Say' => __DIR__ . '/../..' . '/_inc/gateway/Twilio.php',
        'SMSGateway\\Gateway\\Sms' => __DIR__ . '/../..' . '/_inc/gateway/Twilio.php',
        'SMSGateway\\Gateway\\Twilio' => __DIR__ . '/../..' . '/_inc/gateway/Twilio.php',
        'SMSGateway\\Gateway\\TwilioException' => __DIR__ . '/../..' . '/_inc/gateway/Twilio.php',
        'SMSGateway\\Gateway\\TwilioRestClient' => __DIR__ . '/../..' . '/_inc/gateway/Twilio.php',
        'SMSGateway\\Gateway\\TwilioRestResponse' => __DIR__ . '/../..' . '/_inc/gateway/Twilio.php',
        'SMSGateway\\Gateway\\TwilioUtils' => __DIR__ . '/../..' . '/_inc/gateway/Twilio.php',
        'SMSGateway\\Gateway\\Verb' => __DIR__ . '/../..' . '/_inc/gateway/Twilio.php',
        'SMSGateway\\Gateway\\its24' => __DIR__ . '/../..' . '/_inc/gateway/ITS24.php',
        'SMSGateway\\SMSGateway' => __DIR__ . '/../..' . '/_inc/BaseController.php',
    );

    public static function getInitializer(ClassLoader $loader)
    {
        return \Closure::bind(function () use ($loader) {
            $loader->prefixLengthsPsr4 = ComposerStaticInitad1866109e10b4b6658880477167ee83::$prefixLengthsPsr4;
            $loader->prefixDirsPsr4 = ComposerStaticInitad1866109e10b4b6658880477167ee83::$prefixDirsPsr4;
            $loader->classMap = ComposerStaticInitad1866109e10b4b6658880477167ee83::$classMap;

        }, null, ClassLoader::class);
    }
}
