import React from 'react'
import styled from 'styled-components'

const MainViewDiv = styled.div`
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  justify-items: center;
`

const MainView = ({ computer }) => {

  const onRequest = (docs = null) => {
    console.log(docs)
    if (docs == null) {
      computer.request("docs1").print();
      // computer.requestPrint("docs1");
      // computer.requestPrint("docs2");
      // computer.requestPrint("docs3");
      // computer.requestPrint("docs4");
    } else {
      computer.requestPrint(docs);
    } 
  }
  const onRequestReadyList = () => {
    computer.request().readyList();
  }

  return (
    <>
      <h1>프록시 패턴</h1>
      <button onClick={onRequestReadyList}> 남은 대기열 요청 </button>
      <button onClick={() => {onRequest()}}> 시나리오 요청 </button>
      <br />
      <br />
      <input id="customDocs" type="text" placeholder="요청할 문서" />
      <button onClick={() => {onRequest(document.querySelector("input#customDocs").value)} }> 요청 </button>
      
      <br /><br />
      <h1> 로그 </h1>
      <div>
        <MainViewDiv>
          <h3>컴퓨터</h3> 
          <h3>프린터프록시</h3>
          <h3>프린터</h3>
        </MainViewDiv>
        <MainViewDiv>
          <div id="computerLog" style={{height:'100%'}}></div>
          <div id="printerProxyLog" style={{height:'100%'}}></div>
          <div id="printerLog" style={{height:'100%'}}></div>
        </MainViewDiv>
      </div>
      <br /><br />
      <h1> 나머지 로그 </h1>
      <div id="globalLog"></div>
      
    </>
  )
}

export default MainView
