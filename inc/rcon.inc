<?php

const Response 		= 0;
const _ 		= 1;
const Command 		= 2;
const Authenticate	= 3;

class Message
{
	public int $Length;
	public int $ID;
	public int $Type;
	public string $Body;

	public function Init($len, $id, $mt, $bd)
	{
		
		$this->Length = $len;
		$this->ID = $id;
		$this->Type = $mt;
		$this->Body = $bd;
	}
}

class Encoder
{
	public const HeaderLength = 10;

	public function EncodeMessage($msg)
	{
		$len = unpack("C*",pack('L', $msg->Length));
		$id = unpack("C*",pack('L', $msg->ID));
		$type = unpack("C*",pack('L', $msg->Type));
		$tmp = utf8_encode($msg->Body);
		$body = unpack("C*", $tmp);
		
		$bytes = array_merge($len, $id, $type, $body);

		return $bytes;
	}

	public function DecodeMessage($bytes)
	{
		$len_row  = array_slice($bytes, 0, 4);
		$id_row   = array_slice($bytes, 4, 4);
		$type_row = array_slice($bytes, 8, 4);

		$bodyLen = count($bytes) - 12;
		if($bodyLen > 0)
		{
			$body_row = array_slice($bytes, 12, $bodyLen);
		}

		$len_str  = implode(array_map("chr", $len_row));
		$id_str   = implode(array_map("chr", $id_row));
		$type_str = implode(array_map("chr", $type_row));
		$body_str = implode(array_map("chr", $body_row));

		$len  = unpack("i", $len_str )[1];
		$id   = unpack("i", $id_str  )[1];
		$type = unpack("i", $type_str)[1];

		$mess = new Message;
		$mess->Init($len, $id, $type, $body_str);

		return $mess;
	}
}

class MinecraftClient
{
	private const MaxMessageSize = 4110;

	private $fsock;
	private $lastID = 0;
	
	public function Init($address, $port)
	{
		$this->fsock = socket_create(AF_INET, SOCK_STREAM, SOL_TCP);
		$res = socket_connect($this->fsock, $address, $port);
	}

	public function sendMessage($req)
	{
		$enc = new Encoder;
		$encoded = $enc->EncodeMessage($req);
		$encoded_str = implode(array_map("chr", $encoded));
		$res = socket_write($this->fsock, $encoded_str, count($encoded));	
		echo intval($res);
	}

	public function Auth($password)
	{
		$len = strlen($password) + 10;
		$id = $this->lastID;
		$type = 3;

		$mess = new Message;
		$mess->Init($len, $id, $type, $password);
		
		$this->sendMessage($mess);

		$this->lastID = $this->lastID + 1;
	}

	public function SendCommand($command)
	{
		$len = strlen($command) + 10;
		$id = $this->lastID;
		$type = 2;

		$mess = new Message;
		$mess->Init($len, $id, $type, $command);

		$this->sendMessage($mess);

		$this->lastID = $this->lastID + 1;
	}
}

?>