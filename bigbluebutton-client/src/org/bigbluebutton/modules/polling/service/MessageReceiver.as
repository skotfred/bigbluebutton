/**
 * BigBlueButton open source conferencing system - http://www.bigbluebutton.org/
 * 
 * Copyright (c) 2012 BigBlueButton Inc. and by respective authors (see below).
 *
 * This program is free software; you can redistribute it and/or modify it under the
 * terms of the GNU Lesser General Public License as published by the Free Software
 * Foundation; either version 3.0 of the License, or (at your option) any later
 * version.
 * 
 * BigBlueButton is distributed in the hope that it will be useful, but WITHOUT ANY
 * WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
 * PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License along
 * with BigBlueButton; if not, see <http://www.gnu.org/licenses/>.
 *
 */
package org.bigbluebutton.modules.polling.service
{
  import com.asfusion.mate.events.Dispatcher;
  
  import org.bigbluebutton.common.LogUtil;
  import org.bigbluebutton.core.BBB;
  import org.bigbluebutton.main.model.users.IMessageListener;
  import org.bigbluebutton.modules.polling.events.PollEvent;
  import org.bigbluebutton.modules.polling.model.Poll;
  import org.bigbluebutton.modules.polling.model.PollingModel;

  public class MessageReceiver implements IMessageListener
  {
    private static const LOG:String = "Poll::MessageReceiver - ";
    
    /* Injected by Mate */
    public var processor:PollDataProcessor;
    
    public function MessageReceiver() {
      BBB.initConnectionManager().addMessageListener(this);
    }

    public function onMessage(messageName:String, message:Object):void {
//      trace(LOG + "received message " + messageName);

      switch (messageName) {
        case "pollGetPollsReply":
          processor.handleGetPollsReply(message);
          break;
        case "pollCreatedMessage":
          processor.handlePollCreatedMesage(message);
          break;			
        case "pollUpdatedMessage":
          processor.handlePollUpdatedMesage(message);
          break;
        case "pollDestroyedMessage":
          processor.handlePollDestroyedMesage(message);
          break;
        case "pollStartedMessage":
          processor.handlePollStartedMesage(message);
          break;
        case "pollStoppedMessage":
          processor.handlePollStoppedMesage(message);
          break;
        case "pollResultUpdatedMessage":
          processor.handlePollResultUpdatedMesage(message);
          break;
      }
    }


   
  }
}