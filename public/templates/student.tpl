<div id="student" class="easyui-layout" data-options="fit:true">
    <div data-options="region:'north',border:false" style="margin-bottom:1px;">
        <div class="easyui-panel" style="padding:5px;height:28px;" data-options="fit:true">
            <span class="text-item" title="This is the tooltip message."><i class="fa fa-eye"></i><span class="curator-widget">...</span></span>
            <a href="#"  class="easyui-tooltip">Hover me</a>
            <!--
            <span class="easyui-linkbutton" data-options="plain:true,iconCls:'fa fa-user'"><span class="student-widget">...</span></span>
            <span class="easyui-linkbutton" data-options="plain:true,iconCls:'fa fa-eye'" style="float:right;"><span class="curator-widget">...</span></span>
            -->
            <span class="easyui-menubutton" data-options="menu:'#main-menu',iconCls:'fa fa-bars'" style="float:right"></span>
        </div>
    </div>
    <div class="ws-content" data-options="region:'center',border:false">
        <div class="easyui-layout" data-options="fit:true">
            <div data-options="region:'north',border:false" class="ws-widget" style="height:40%">
                <div id="panel-webcam" class="easyui-panel ws-panel" title="Видеокамера" data-options="fit:true,iconCls:'fa fa-video-camera',maximizable:true">
                    <!-- Begin: Webcam -->
                    <video class="video-output" autoplay poster="images/webrtc.png"></video>
                    <video class="video-input" autoplay poster="images/webrtc.png"></video>
                    <!-- End: Webcam -->
                </div>
            </div>
            <div data-options="region:'center',border:false" class="ws-widget">
                <div id="panel-chat" class="easyui-panel ws-panel" title="Сообщения" data-options="fit:true,iconCls:'fa fa-comments-o',maximizable:true">
                    <!-- Begin: Chat -->
                    <div class="easyui-layout" data-options="fit:true">
                        <div class="chat-panel" data-options="region:'center',border:false" style="overflow-x:hidden;word-wrap:break-word;">
                            <ul class="chat-output" style="list-style-type:none; padding:.3em; margin:0"></ul>
                        </div>
                        <div data-options="region:'south',split:true,border:false">
                            <div class="easyui-layout" data-options="fit:true">
                                <div data-options="region:'north',border:false">
                                    <div class="easyui-panel" data-options="fit:true" style="padding:3px;border-left:0;border-right:0;height:28px;">
                                        <button class="easyui-linkbutton chat-file-btn" data-options="plain:true,iconCls:'fa fa-download'" style="float:left;display:none;">
                                            <div class="easyui-progressbar chat-progress" data-options="width:150,height:18" style="margin:3px 0 3px 0"></div>
                                        </button>
                                        <button class="easyui-linkbutton chat-send-btn" data-options="plain:true,iconCls:'fa fa-paper-plane-o'" style="float:right">Отправить</button>
                                        <button class="easyui-linkbutton chat-attach-btn" data-options="plain:true,iconCls:'fa fa-paperclip'" style="float:right">Прикрепить</button>
                                        <form method="post" enctype="multipart/form-data" style="display:none;">
                                            <input type="file" name="chatFile" class="chat-attach-input" />
                                        </form>
                                    </div>
                                </div>
                                <div class="chat-input" data-options="region:'center',border:false" contenteditable="true" style="height:100px;overflow-x:hidden;"></div>
                            </div>
                        </div>
                    </div>
                    <!-- End: Chat -->
                </div>
            </div>
        </div>
    </div>
    <div data-options="region:'south',border:false" style="margin-top:1px;">
        <div class="easyui-panel" style="padding:5px;height:28px;" data-options="fit:true">
            <span class="text-item" title="Качество связи"><i class="fa fa-exchange"></i><span class="panel-widget network-widget">100%</span></span>
            <span class="text-item" title="Текущее время"><i class="fa fa-clock-o"></i><span class="panel-widget time-widget">00:00:00</span></span>
            <span class="text-item" title="Продолжительность"><i class="fa fa-play"></i><span class="panel-widget duration-widget">00:00:00</span></span>
            <!--<a href="javascript:void(0)" class="easyui-linkbutton app-logout" data-options="plain:true,iconCls:'fa fa-sign-out'" style="float:right;">Выход</a>-->
        </div>
    </div>
</div>
<!-- Begin: Screen -->
<div id="panel-screen" style="display:none">
    <video class="video-input" autoplay poster="images/webrtc.png"></video>
</div>
<!-- End: Screen -->
<div id="main-menu" style="width:150px;">
    <div name="profile" data-options="iconCls:'fa fa-user'">Профиль</div>
    <div name="settings" data-options="iconCls:'fa fa-wrench'">Настройки</div>
    <div class="menu-sep"></div>
    <div name="logout" data-options="iconCls:'fa fa-sign-out'">Выход</div>
</div>
<script type="text/template" id="chat-item-tpl">
<div class="chat-view">
    <% var color = app.profile.isMe(author._id) ? 'red' : 'blue'; %>
    <span style="font-weight: bold;padding-right:.5em;color:<%- color %>"><%- moment(time).format('HH:mm') %> <%- author.lastname %> <%- author.firstname.charAt(0) %>.<%- author.middlename.charAt(0) %>.:</span><span><%= text %>
        <% if(attach.length > 0) { %>
            <% _.each(attach, function(element, index, list){ %>
                <i class="fa fa-paperclip"></i>&nbsp;<a href="/storage/<%- element.fileId %>" target="_blank"><%- element.filename %></a>
            <% }); %>
        <% } %>
    </span>
</div>
</script>